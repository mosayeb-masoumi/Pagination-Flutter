
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_example/bloc_clean/data/user_model.dart';
import 'package:flutter_pagination_example/bloc_clean/presentation/bloc/user_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../di/di.dart';


class BlocPaginationExample extends StatefulWidget {
  const BlocPaginationExample({super.key});

  @override
  State<BlocPaginationExample> createState() => _BlocPaginationExampleState();
}

class _BlocPaginationExampleState extends State<BlocPaginationExample> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserCubit(sl())),
        ],
        child: const IBlocPaginationExample());
  }
}

class IBlocPaginationExample extends StatefulWidget {
  const IBlocPaginationExample({super.key});

  @override
  State<IBlocPaginationExample> createState() => _IBlocPaginationExampleState();
}

class _IBlocPaginationExampleState extends State<IBlocPaginationExample> {

  late final UserCubit bloc;
  late final StreamSubscription subscription;


  static const _pageSize = 12;
  final PagingController<int , UserModel> _pagingController = PagingController(firstPageKey: 0);

  int globalPageKey = 0;


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<UserCubit>(context);
    subscriptionListener();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    globalPageKey = pageKey;
    bloc.fetchList(pageKey,  _pageSize);
  }


  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final newItems = await MyRepository().fetchPalyListName(pageKey, _pageSize);
  //     final isLastPage = newItems.length < _pageSize;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + newItems.length;
  //       _pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }




  void subscriptionListener() {
    subscription = bloc.stream.listen((state) {
      if (state is UserListLoading) {
        var a = 5;
      } else if (state is UserListError) {
        _pagingController.error = state.error;
      } else if (state is UserListLoaded) {

        try {
          var newItems = state.list;
          final isLastPage = newItems.length < _pageSize;
          if (isLastPage) {
            _pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = globalPageKey + newItems.length;
            _pagingController.appendPage(newItems, nextPageKey);
          }
        } catch (error) {
          _pagingController.error = error;
        }
      }
    });
  }


  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView<int, UserModel>(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // addAutomaticKeepAlives: true,
        physics: const AlwaysScrollableScrollPhysics(),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<UserModel>(
            animateTransitions: true,
            itemBuilder: (context, item, index) =>
                myItem(model: item, index: index)
          // getColumnCard(item, index , context),
        ),
      ),
    );
  }







  Widget myItem({required UserModel model, required int index}) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: 100,
      margin:const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red, width: 1)),
      child: Center(
        child: Text(
          "${model.name} ${model.family} --> $index",
          style:
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


}








import 'package:flutter/material.dart';
import 'package:flutter_pagination_example/static/repository2.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../model/character_summary.dart';
import 'character_list_item.dart';


class PaginationStatic extends StatefulWidget {
  const PaginationStatic({Key? key}) : super(key: key);

  @override
  _PaginationStaticState createState() => _PaginationStaticState();
}

class _PaginationStaticState extends State<PaginationStatic> {

  static const _pageSize = 8;
  final PagingController<int , CharacterSummary> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);

      final newItems = await MyRepository().fetchPalyListName(pageKey, _pageSize);


      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView<int, CharacterSummary>.separated(

        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CharacterSummary>(
          animateTransitions: true,

          firstPageProgressIndicatorBuilder: (_) =>
              firstPageIndicator(context),
          newPageProgressIndicatorBuilder: (_) =>
              NewItemIndicator(context),
          // noMoreItemsIndicatorBuilder: (_) => NoMoreItemIndicator(context),
          noItemsFoundIndicatorBuilder: (_) =>
              noFirstItemsFoundIndicator(context),
          newPageErrorIndicatorBuilder: (_) =>
              newPageErrorIndicatorBuilder(context),
          firstPageErrorIndicatorBuilder: (_) =>
              firstPageErrorIndicatorBuilder(context),



          itemBuilder: (context, item, index) => CharacterListItem(character: item, index: index),
          // itemBuilder: (context, item, index) {
          //   return myWidget(context ,item ,index);
          // }


        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }


  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Widget NewItemIndicator(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 10),
      color: Colors.yellow,
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            " ...در حال دریافت",
            style: TextStyle(color: Colors.black26),
            textAlign: TextAlign.right,
          )),
    );
  }

  Widget NoMoreItemIndicator(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 10),
      color: Colors.yellow,
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "!آیتم بیشتری برای نمایش وجود ندارد",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
          )),
    );
  }

  Widget newPageErrorIndicatorBuilder(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 10),
      color: Colors.yellow,
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "!خطا در دریافت اطلاعات",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
          )),
    );
  }

  Widget firstPageIndicator(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: Colors.yellow,
        ));
  }

  Widget noFirstItemsFoundIndicator(BuildContext context) {
    return Center(
        child: Text(
          "آیتمی برای نمایش وجود ندارد",
          style: TextStyle(color: Colors.yellow),
        ));
  }

  Widget firstPageErrorIndicatorBuilder(BuildContext context) {
    return Center(
        child: Text(
          "!خطا در دریافت اطلاعات",
          style: TextStyle(color: Colors.yellow),
        ));
  }


}

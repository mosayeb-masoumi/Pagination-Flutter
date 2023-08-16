import 'package:bloc/bloc.dart';
import 'package:flutter_pagination_example/bloc_clean/data/user_model.dart';
import 'package:meta/meta.dart';

import '../../domain/user_usecase.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserUseCase _useCase;
  UserCubit(this._useCase) : super(const UserInitial());


  Future<dynamic> fetchList(int pageKey,int pageSize) async {
    try{
      emit(const UserListLoading());
      var result = await _useCase.fetchUserList(pageKey, pageSize);
      emit(UserListLoaded(result));
    }catch(error){
      emit(UserListError(error.toString()));
    }
  }

}

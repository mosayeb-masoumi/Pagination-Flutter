import 'package:flutter_pagination_example/bloc_clean/data/user_model.dart';

abstract class UserDataSource {
  Future<dynamic> fetchUserList(int pageKey, int pageSize);
}

class IUserDataSource extends UserDataSource {
  @override
  Future<dynamic> fetchUserList(int pageKey, int pageSize) async {
    await Future.delayed(const Duration(seconds: 2));

    List<UserModel> list = [];
    list.add(UserModel(id: 1, name: "1ali", family: "rezai"));
    list.add(UserModel(id: 1, name: "2nabi", family: "rezai"));
    list.add(UserModel(id: 1, name: "3reza", family: "rezai"));
    list.add(UserModel(id: 1, name: "4hh", family: "rezai"));
    list.add(UserModel(id: 1, name: "5fghf", family: "rezai"));
    list.add(UserModel(id: 1, name: "6ali", family: "rezai"));
    list.add(UserModel(id: 1, name: "7tyrt", family: "rezai"));
    list.add(UserModel(id: 1, name: "8uetty", family: "rezai"));
    list.add(UserModel(id: 1, name: "9yutw", family: "rezai"));
    list.add(UserModel(id: 1, name: "10qewr", family: "rezai"));
    list.add(UserModel(id: 1, name: "11qrt", family: "rezai"));
    list.add(UserModel(id: 1, name: "12dfhj", family: "rezai"));

    return list;
  }
}

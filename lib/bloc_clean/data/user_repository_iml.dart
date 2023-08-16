

import 'package:flutter_pagination_example/bloc_clean/data/user_data_source.dart';
import 'package:flutter_pagination_example/bloc_clean/domain/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future fetchUserList(int pageKey, int pageSize) {
    return _dataSource.fetchUserList(pageKey, pageSize);
  }
}

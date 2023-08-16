
import 'package:flutter_pagination_example/bloc_clean/domain/user_repository.dart';

class UserUseCase extends UserRepository {
  final UserRepository _repository;

  UserUseCase(this._repository);

  @override
  Future fetchUserList(int pageKey, int pageSize) {
    return _repository.fetchUserList(pageKey, pageSize);
  }


}
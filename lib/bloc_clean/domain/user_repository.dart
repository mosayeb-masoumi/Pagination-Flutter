abstract class UserRepository {
  Future<dynamic> fetchUserList(int pageKey, int pageSize);
}
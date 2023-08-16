

part of 'user_cubit.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}


class UserListLoading extends UserState {
  const UserListLoading();
}

class UserListLoaded extends UserState {
  final List<UserModel> list ;
  const UserListLoaded(this.list);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserListLoaded &&
          runtimeType == other.runtimeType &&
          list == other.list;

  @override
  int get hashCode => list.hashCode;
}


class UserListError extends UserState {
  final String error;
  const UserListError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserListError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}

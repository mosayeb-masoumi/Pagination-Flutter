

import 'package:flutter_pagination_example/bloc_clean/data/user_data_source.dart';
import 'package:get_it/get_it.dart';

import '../bloc_clean/data/user_repository_iml.dart';
import '../bloc_clean/domain/user_repository.dart';
import '../bloc_clean/domain/user_usecase.dart';
import '../bloc_clean/presentation/bloc/user_cubit.dart';

final sl = GetIt.instance;
void setUpDI(){

 // bloc example
  sl.registerLazySingleton<UserDataSource>(() => IUserDataSource());
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<UserUseCase>(() => UserUseCase(sl()));
  sl.registerLazySingleton<UserCubit>(() => UserCubit(sl()));

}
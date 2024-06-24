import 'package:adminfeature/features/employeefeature/data/repositories/emp_response_repository_impl.dart';
import 'package:adminfeature/features/employeefeature/domain/repositories/emp_response_repository.dart';
import 'package:adminfeature/features/employeefeature/domain/usecases/get_emp_data_usecase.dart';
import 'package:adminfeature/features/employeefeature/presentation/bloc/emp_cubit.dart';
import 'package:adminfeature/features/stafffeature/data/datasources/staff_remote_data_source.dart';
import 'package:adminfeature/features/stafffeature/domain/usecases/get_staff_data_usecase.dart';
import 'package:adminfeature/features/stafffeature/presentation/bloc/staff_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/employeefeature/data/datasources/emp_remote_data_source.dart';
import 'features/stafffeature/data/repositories/staff_response_repository_impl.dart';
import 'features/stafffeature/domain/repositories/staff_response_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(
    () => EmpCubit(
      sl(),
    ),
  );
  //usecase

  sl.registerLazySingleton(
    () => GetEmpDataUsecase(
      sl(),
    ),
  );
  //Repository
  sl.registerLazySingleton<EmpResponseRepository>(
    () => EmpResponseRepositoryImpl(
      empRemoteDataSourse: sl(),
    ),
  );

  //data sources
  sl.registerLazySingleton<EmpRemoteDataSourse>(
    () => EmpRemoteDateSourseImpl(dio: sl()),
  );

  //cubit
  sl.registerFactory(
    () => StaffCubit(
      sl(),
    ),
  );

  //usecase
  sl.registerLazySingleton(
    () => GetStaffDataUsecase(
      sl(),
    ),
  );

  //Repository
  sl.registerLazySingleton<StaffResponseRepository>(
    () => StaffResponseRepositoryImpl(
      staffRemoteDataSouce: sl(),
    ),
  );

  //data sources
  sl.registerLazySingleton<StaffRemoteDataSouce>(
    () => StaffRemoteDataSouceImpl(dio: sl()),
  );

  sl.registerLazySingleton(() => Dio());
}

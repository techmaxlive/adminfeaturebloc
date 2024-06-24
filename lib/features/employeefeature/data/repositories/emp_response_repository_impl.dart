import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/employeefeature/data/datasources/emp_remote_data_source.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_request_entity.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_responce_entity.dart';
import 'package:adminfeature/features/employeefeature/domain/repositories/emp_response_repository.dart';
import 'package:dartz/dartz.dart';

class EmpResponseRepositoryImpl implements EmpResponseRepository {
  final EmpRemoteDataSourse empRemoteDataSourse;
  EmpResponseRepositoryImpl({required this.empRemoteDataSourse});
  @override
  Future<Either<Failure, List<EmpResponseEntity>>> getEmpData(
    EmpReqEntity reqEntity,
  ) async {
    try {
      final data = await empRemoteDataSourse.getEmployeeData(reqEntity);
      return Right(data);
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_request_entity.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_responce_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EmpResponseRepository {
  Future<Either<Failure, List<EmpResponseEntity>>> getEmpData(
    EmpReqEntity reqEntity,
  );
}

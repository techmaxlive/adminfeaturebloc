import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_request_entity.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StaffResponseRepository {
  Future<Either<Failure, List<StaffResponseEntity>>> getStaffData(
    StaffReqEntity staffReqEntity,
  );
}

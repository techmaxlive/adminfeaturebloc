import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/stafffeature/data/datasources/staff_remote_data_source.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_request_entity.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_response_entity.dart';
import 'package:adminfeature/features/stafffeature/domain/repositories/staff_response_repository.dart';
import 'package:dartz/dartz.dart';

class StaffResponseRepositoryImpl implements StaffResponseRepository {
  final StaffRemoteDataSouce staffRemoteDataSouce;
  StaffResponseRepositoryImpl({
    required this.staffRemoteDataSouce,
  });

  @override
  Future<Either<Failure, List<StaffResponseEntity>>> getStaffData(
    StaffReqEntity staffReqEntity,
  ) async {
    try {
      final data = await staffRemoteDataSouce.getStaffData(staffReqEntity);
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

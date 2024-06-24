import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/core/usecase/usecase.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_request_entity.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_response_entity.dart';
import 'package:adminfeature/features/stafffeature/domain/repositories/staff_response_repository.dart';
import 'package:dartz/dartz.dart';

class GetStaffDataUsecase
    implements UseCase<List<StaffResponseEntity>, StaffReqEntity> {
  final StaffResponseRepository staffResponseRepository;
  GetStaffDataUsecase(
    this.staffResponseRepository,
  );
  @override
  Future<Either<Failure, List<StaffResponseEntity>>> call(
    StaffReqEntity params,
  ) async {
    return await staffResponseRepository.getStaffData(
      params,
    );
  }
}

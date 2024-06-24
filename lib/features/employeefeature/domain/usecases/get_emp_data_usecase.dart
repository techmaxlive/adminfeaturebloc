import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/core/usecase/usecase.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_request_entity.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_responce_entity.dart';
import 'package:adminfeature/features/employeefeature/domain/repositories/emp_response_repository.dart';
import 'package:dartz/dartz.dart';

class GetEmpDataUsecase
    implements UseCase<List<EmpResponseEntity>, EmpReqEntity> {
  final EmpResponseRepository responseRepository;
  GetEmpDataUsecase(
    this.responseRepository,
  );
  @override
  Future<Either<Failure, List<EmpResponseEntity>>> call(
      EmpReqEntity reqEntity) async {
    return await responseRepository.getEmpData(
      reqEntity,
    );
  }
}

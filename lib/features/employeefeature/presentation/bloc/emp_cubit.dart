import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_request_entity.dart';
import 'package:adminfeature/features/employeefeature/domain/usecases/get_emp_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'employeefeature_state.dart';

class EmpCubit extends Cubit<EmployeefeatureState> {
  GetEmpDataUsecase getEmpDataUsercase;
  EmpCubit(this.getEmpDataUsercase) : super(EmployeefeatureInitial());

  Future<void> getEmpDataList(EmpReqEntity empReqEntity) async {
    emit(EmployeefeatureLoading());
    final result = await getEmpDataUsercase(empReqEntity);
    result.fold(
      (failure) => {
        emit(
          EmployeefeatureError(
            ServerFailure(
              errorMessage: failure.errorMessage,
            ),
          ),
        ),
      },
      (success) => {
        emit(
          EmployeefeatureLoaded(
            success,
          ),
        ),
      },
    );
  }
}

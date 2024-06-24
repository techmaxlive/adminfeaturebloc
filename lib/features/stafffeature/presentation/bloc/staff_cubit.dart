import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_request_entity.dart';
import 'package:adminfeature/features/stafffeature/domain/usecases/get_staff_data_usecase.dart';
import 'package:adminfeature/features/stafffeature/presentation/bloc/staff_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffCubit extends Cubit<StafffeatureState> {
  final GetStaffDataUsecase getStaffDataUsecase;
  StaffCubit(this.getStaffDataUsecase) : super(StaffInitial());
  Future<void> getStaffDataList(StaffReqEntity staffReqEntity) async {
    emit(StaffLoding());
    final result = await getStaffDataUsecase(staffReqEntity);
    result.fold(
      (failure) => {
        emit(
          StaffError(
            ServerFailure(
              errorMessage: failure.errorMessage,
              status: failure.status,
            ),
          ),
        ),
      },
      (success) => {
        emit(
          StaffLoaded(
            success,
          ),
        ),
      },
    );
  }
}

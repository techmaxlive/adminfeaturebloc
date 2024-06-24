import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_response_entity.dart';
import 'package:equatable/equatable.dart';

abstract class StafffeatureState extends Equatable {
  const StafffeatureState();

  @override
  List<Object> get props => [];
}

class StaffInitial extends StafffeatureState {}

class StaffLoding extends StafffeatureState {}

class StaffLoaded extends StafffeatureState {
  final List<StaffResponseEntity> staffLi;
  const StaffLoaded(
    this.staffLi,
  );
}

class StaffError extends StafffeatureState {
  final ServerFailure serverFailure;
  const StaffError(
    this.serverFailure,
  );
}

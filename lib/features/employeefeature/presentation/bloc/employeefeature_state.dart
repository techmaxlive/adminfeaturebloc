import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_responce_entity.dart';
import 'package:equatable/equatable.dart';

abstract class EmployeefeatureState extends Equatable {
  const EmployeefeatureState();

  @override
  List<Object> get props => [];
}

class EmployeefeatureInitial extends EmployeefeatureState {}

class EmployeefeatureLoading extends EmployeefeatureState {}

class EmployeefeatureLoaded extends EmployeefeatureState {
  final List<EmpResponseEntity> employeeLi;
  const EmployeefeatureLoaded(
    this.employeeLi,
  );
}

class EmployeefeatureError extends EmployeefeatureState {
  final ServerFailure serverFailure;
  const EmployeefeatureError(
    this.serverFailure,
  );
}

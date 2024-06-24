import 'package:equatable/equatable.dart';

class EmpReqEntity extends Equatable {
  final String employeeId;

  const EmpReqEntity({
    required this.employeeId,
  });

  @override
  List<Object?> get props => [
        employeeId,
      ];
}

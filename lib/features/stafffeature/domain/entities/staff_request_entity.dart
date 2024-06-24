import 'package:equatable/equatable.dart';

class StaffReqEntity extends Equatable {
  final String staffId;

  const StaffReqEntity({
    required this.staffId,
  });

  @override
  List<Object?> get props => [
        staffId,
      ];
}

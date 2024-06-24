import 'package:equatable/equatable.dart';

class StaffResponseEntity extends Equatable {
  final String id;
  final String name;
  final String dept;
  final String email;
  final String phone;
  final String age;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  const StaffResponseEntity({
    required this.id,
    required this.name,
    required this.dept,
    required this.email,
    required this.phone,
    required this.age,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  @override
  List<Object> get props => [
        id,
        name,
        dept,
        email,
        phone,
        age,
        createdAt,
        updatedAt,
        v,
      ];
}

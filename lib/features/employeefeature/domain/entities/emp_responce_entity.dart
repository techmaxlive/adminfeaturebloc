import 'package:equatable/equatable.dart';

class EmpResponseEntity extends Equatable {
  final String id;
  final String name;
  final String designation;
  final String email;
  final String phone;
  final String age;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  const EmpResponseEntity({
    required this.id,
    required this.name,
    required this.designation,
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
        designation,
        email,
        phone,
        age,
        createdAt,
        updatedAt,
        v,
      ];
}

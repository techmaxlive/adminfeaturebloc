import 'package:adminfeature/features/employeefeature/domain/entities/emp_responce_entity.dart';

class EmpResposeModel extends EmpResponseEntity {
  const EmpResposeModel({
    required super.id,
    required super.name,
    required super.designation,
    required super.email,
    required super.phone,
    required super.age,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
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

  factory EmpResposeModel.fromJson(Map<String, dynamic> json) {
    return EmpResposeModel(
      id: json['_id'],
      name: json['name'],
      designation: json['designation'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'designation': designation,
      'email': email,
      'phone': phone,
      'age': age,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

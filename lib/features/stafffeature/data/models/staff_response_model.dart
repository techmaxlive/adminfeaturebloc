import 'package:adminfeature/features/stafffeature/domain/entities/staff_response_entity.dart';

class StaffResponseModel extends StaffResponseEntity {
  const StaffResponseModel(
      {required super.id,
      required super.name,
      required super.dept,
      required super.email,
      required super.phone,
      required super.age,
      required super.createdAt,
      required super.updatedAt,
      required super.v});

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

  factory StaffResponseModel.fromJson(Map<String, dynamic> json) {
    return StaffResponseModel(
      id: json['_id'],
      name: json['name'],
      dept: json['dept'],
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
      'dept': dept,
      'email': email,
      'phone': phone,
      'age': age,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

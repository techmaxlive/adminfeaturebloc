import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/employeefeature/data/models/employee_response_model.dart';
import 'package:adminfeature/features/employeefeature/domain/entities/emp_request_entity.dart';
import 'package:dio/dio.dart';

abstract class EmpRemoteDataSourse {
  Future<List<EmpResposeModel>> getEmployeeData(EmpReqEntity reqEntity);
}

class EmpRemoteDateSourseImpl implements EmpRemoteDataSourse {
  final Dio dio;
  EmpRemoteDateSourseImpl({required this.dio});
  @override
  Future<List<EmpResposeModel>> getEmployeeData(EmpReqEntity reqEntity) async {
    try {
      final url =
          'http://192.168.0.101:3000/api/employee?employeeId=${reqEntity.employeeId}';
      final response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var result = (response.data['response'] as List)
            .map((item) => EmpResposeModel.fromJson(item))
            .toList();
        return result;
      } else {
        throw ServerFailure(
          errorMessage: response.statusMessage,
          status: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw ServerFailure(
        errorMessage: e.message,
      );
      //
    } catch (e) {
      throw ServerFailure(
        errorMessage: e.toString(),
      );
    }
  }
}

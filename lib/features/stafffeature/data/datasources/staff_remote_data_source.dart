import 'package:adminfeature/core/error/failure.dart';
import 'package:adminfeature/features/stafffeature/data/models/staff_response_model.dart';
import 'package:adminfeature/features/stafffeature/domain/entities/staff_request_entity.dart';
import 'package:dio/dio.dart';

abstract class StaffRemoteDataSouce {
  Future<List<StaffResponseModel>> getStaffData(StaffReqEntity staffReqEntity);
}

class StaffRemoteDataSouceImpl implements StaffRemoteDataSouce {
  final Dio dio;
  StaffRemoteDataSouceImpl({required this.dio});
  @override
  Future<List<StaffResponseModel>> getStaffData(
      StaffReqEntity staffReqEntity) async {
    try {
      final url =
          'http://192.168.0.101:3000/api/staff?staffId=${staffReqEntity.staffId}';
      final response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var li = (response.data['response'] as List)
            .map((item) => StaffResponseModel.fromJson(item))
            .toList();
        return li;
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
    } catch (e) {
      throw ServerFailure(
        errorMessage: e.toString(),
      );
    }
  }
}

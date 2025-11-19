import 'package:dio/dio.dart';
import 'package:easacc_flutter_task/core/network/api_constants.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await _dio.get(
      "${ApiConstants.baseUrl}$endPoint",
      queryParameters: queryParameters,
      options: Options(
        method: 'GET',
        headers: {
          'api-key': ApiConstants.apiKey,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    var response = await _dio.post(
      queryParameters: queryParameters,
      "${ApiConstants.baseUrl}$endPoint",
      data: isFromData ? FormData.fromMap(data!) : data,
      options: Options(
        method: 'POST',
        headers: {
          'api-key': ApiConstants.apiKey,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    var response = await _dio.request(
      queryParameters: queryParameters,
      "${ApiConstants.baseUrl}$endPoint",
      data: isFromData ? FormData.fromMap(data!) : data,
      options: Options(
        method: 'PUT',
        headers: {
          'api-key': ApiConstants.apiKey,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.delete(
      "${ApiConstants.baseUrl}$endPoint",
      options: Options(
        method: 'DELETE',
        headers: {
          'api-key': ApiConstants.apiKey,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }
}

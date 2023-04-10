import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_mate/core/models/weather_model.dart';

import '../../base/base_model.dart';
import '../../base/request_validator.dart';
import '../../constant/app_constants.dart';

class NetworkService {
  static NetworkService? _instance;

  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  late final Dio _dio;
  late final BaseOptions _baseOptions;

  NetworkService._init() {
    _baseOptions = BaseOptions(baseUrl: AppConstants.url);
    _dio = Dio(_baseOptions);
  }

  Future<ResponseModel<T?>> requestHandler<T>(String endPoint,
      {Map? body,
      BaseModel? parseModel,
      RequestType? type = RequestType.post,
      Map<String, dynamic>? queries = const {},
      bool? haveAuth = true,
      List<BaseErrorValidatorModel>? validators,
      bool? justDecode = false}) async {
    try {
      body = body ?? {};
      var _response = await _dio.request(endPoint,
          options: Options(method: type!.name), data: body, queryParameters: queries);

      debugPrint(' ==== $endPoint === $body === ${_response.data}');
      if (_response.statusCode==200) {
        return ResponseModel<T>(
            status: ResponseStatusEnum.success,
            response: justDecode!
                ? _response.data
                : ((parseModel as BaseModel<T>).fromJson(_response.data)));
      } else {
        String? errorMessage = _response.data['error_message'];

        if (errorMessage != null) {
          if (errorMessage.contains('Credentials invalid')) {}
          switch (errorMessage) {
            
          }
        }

        RequestValidator.instance
            .baseValidator(_response.data['error_message'] ?? '', validators: validators);
        return ResponseModel(status: ResponseStatusEnum.info, error: _response.data.toString());
      }
    } catch (e) {
      debugPrint("val: " + e.toString());
      return ResponseModel(status: ResponseStatusEnum.error, error: 'Bir hata oluştu');
    }
  }
}

class ResponseModel<T> {
  final ResponseStatusEnum status;
  T? response;
  String? error;

  ResponseModel({required this.status, this.response, this.error});
}

enum ResponseStatusEnum { success, info, error }

enum RequestType {
  get,
  post,
  put,
  delete,
}

// final baseUrl =
//     'https://api.open-meteo.com/v1/forecast?latitude=41.01&longitude=28.95&hourly=temperature_2m';
// final dio = Dio(BaseOptions(baseUrl: baseUrl));

// Future getData(double latitude, double longitude) async {
// //Queryparams
// //DataGelmediğiDurumYok

//   try {
//     final response = await dio.get('https://api.open-meteo.com/v1/forecast',
//         queryParameters: {"latitude": latitude, "longitude": longitude});

//     Map<String, dynamic> res = response.data as Map<String, dynamic>;

//     return WeaterModel.fromJson(res);
//   } catch (e) {
//     // ignore: avoid_print
//     print('Error occurred: $e');
//   }
// }

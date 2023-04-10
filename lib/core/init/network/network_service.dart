import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_mate/core/constant/enum.dart';
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
      var response = await _dio.request(endPoint,
          options: Options(method: type!.name), data: body, queryParameters: queries);

      debugPrint(' ==== $endPoint === $body === ${response.data}');
      if (response.statusCode == 200) {
        return ResponseModel<T>(
            status: ResponseStatusEnum.success,
            response: justDecode!
                ? response.data
                : ((parseModel as BaseModel<T>).fromJson(response.data)));
      } else {
        String? errorMessage = response.data['error_message'];

        if (errorMessage != null) {
          if (errorMessage.contains('Credentials invalid')) {}
          switch (errorMessage) {
            
          }
        }

        RequestValidator.instance
            .baseValidator(response.data['error_message'] ?? '', validators: validators);
        return ResponseModel(status: ResponseStatusEnum.info, error: response.data.toString());
      }
    } catch (e) {
      debugPrint("val: $e");
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

import 'package:weather_mate/core/base/request_validator.dart';

class RequestValidatorConstants {
  static RequestValidatorConstants? _instance;

  static RequestValidatorConstants get instance {
    _instance ??= RequestValidatorConstants._init();
    return _instance!;
  }

  RequestValidatorConstants._init();

  List<BaseErrorValidatorModel> generalErrors = [
    BaseErrorValidatorModel(error: "Credentials invalid", message: ""),
    BaseErrorValidatorModel(error: "Invalid", message: ""),
    BaseErrorValidatorModel(error: "Timing: Wait to resend sms", message: ""),
    BaseErrorValidatorModel(error: "Credentials invalid", message: ""),
  ];
}

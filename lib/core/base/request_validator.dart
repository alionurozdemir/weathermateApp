import '../constant/request_validator_canstants.dart';
import '../widgets/toast_widget.dart';

class RequestValidator {
  static RequestValidator? _instance;

  static RequestValidator get instance {
    _instance ??= RequestValidator._init();
    return _instance!;
  }

  RequestValidator._init();

  void baseValidator(String error, {List<BaseErrorValidatorModel>? validators}) {
    if (error == '') {
      // show default error
    }
    if (true) {
      var all = [...validators ?? [], ...RequestValidatorConstants.instance.generalErrors];
      for (var item in all) {
        if (error.contains(item.error ?? '')) {
          showToast(item.message ?? "");
          // item.action();
        }
      }
    }
  }
}

class BaseErrorValidatorModel {
  final String? error;
  final String? message;
  Future<Function>? action;

  BaseErrorValidatorModel({this.error, this.message, this.action});
}

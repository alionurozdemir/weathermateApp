import 'package:weather_mate/core/constant/app_constants.dart';
import 'package:weather_mate/core/init/network/network_service.dart';
import 'package:weather_mate/core/models/weather_model.dart';

class WeatherService {
  static WeatherService? _instance;

  static WeatherService get instance {
    _instance ??= WeatherService._init();
    return _instance!;
  }

  late final NetworkService _networkService;

  WeatherService._init() {
    _networkService = NetworkService.instance;
  }

  Future<WeaterModel> getCurrentWeather(double latitude, double longitude) async {
    var x = await _networkService.requestHandler<WeaterModel>(AppConstants.url,
        queries: {"latitude": latitude, "longitude": longitude, "hourly": "temperature_2m"},
        parseModel: WeaterModel(),
        type: RequestType.get);
    return x.response!;
  }
}

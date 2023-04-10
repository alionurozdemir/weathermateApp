import '../base/base_model.dart';

class WeaterModel extends BaseModel<WeaterModel> {
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeaterModel(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.hourlyUnits,
      this.hourly});

  WeaterModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    return data;
  }

  @override
  WeaterModel fromJson(Map<String, dynamic>? json) {
    return WeaterModel.fromJson(json!);
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativehumidity2m;
  String? apparentTemperature;
  String? precipitationProbability;
  String? windspeed10m;
  String? windspeed80m;
  String? windspeed120m;
  String? windspeed180m;
  String? temperature80m;
  String? temperature120m;
  String? temperature180m;

  HourlyUnits(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.apparentTemperature,
      this.precipitationProbability,
      this.windspeed10m,
      this.windspeed80m,
      this.windspeed120m,
      this.windspeed180m,
      this.temperature80m,
      this.temperature120m,
      this.temperature180m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    relativehumidity2m = json['relativehumidity_2m'];
    apparentTemperature = json['apparent_temperature'];
    precipitationProbability = json['precipitation_probability'];
    windspeed10m = json['windspeed_10m'];
    windspeed80m = json['windspeed_80m'];
    windspeed120m = json['windspeed_120m'];
    windspeed180m = json['windspeed_180m'];
    temperature80m = json['temperature_80m'];
    temperature120m = json['temperature_120m'];
    temperature180m = json['temperature_180m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['apparent_temperature'] = apparentTemperature;
    data['precipitation_probability'] = precipitationProbability;
    data['windspeed_10m'] = windspeed10m;
    data['windspeed_80m'] = windspeed80m;
    data['windspeed_120m'] = windspeed120m;
    data['windspeed_180m'] = windspeed180m;
    data['temperature_80m'] = temperature80m;
    data['temperature_120m'] = temperature120m;
    data['temperature_180m'] = temperature180m;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<num>? relativehumidity2m;
  List<num>? apparentTemperature;
  List<num>? precipitationProbability;
  List<num>? windspeed10m;
  List<num>? windspeed80m;
  List<num>? windspeed120m;
  List<num>? windspeed180m;
  List<num>? temperature80m;
  List<num>? temperature120m;
  List<num>? temperature180m;

  Hourly(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.apparentTemperature,
      this.precipitationProbability,
      this.windspeed10m,
      this.windspeed80m,
      this.windspeed120m,
      this.windspeed180m,
      this.temperature80m,
      this.temperature120m,
      this.temperature180m});
  Hourly.fromJson(Map<String, dynamic> json) {
    time = (json['time'] as List?)?.map((e) => e.toString()).toList();
    temperature2m =
        (json['temperature_2m'] as List?)?.map((e) => double.tryParse(e.toString()) ?? 0).toList();
    relativehumidity2m = (json['relativehumidity_2m'] as List?)
        ?.map((e) => num.tryParse(e.toString()) ?? 0)
        .toList();
    apparentTemperature = (json['apparent_temperature'] as List?)
        ?.map((e) => num.tryParse(e.toString()) ?? 0)
        .toList();
    precipitationProbability = (json['precipitation_probability'] as List?)
        ?.map((e) => num.tryParse(e.toString()) ?? 0)
        .toList();
    windspeed10m =
        (json['windspeed_10m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    windspeed80m =
        (json['windspeed_80m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    windspeed120m =
        (json['windspeed_120m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    windspeed180m =
        (json['windspeed_180m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    temperature80m =
        (json['temperature_80m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    temperature120m =
        (json['temperature_120m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    temperature180m =
        (json['temperature_180m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['apparent_temperature'] = apparentTemperature;
    data['precipitation_probability'] = precipitationProbability;
    data['windspeed_10m'] = windspeed10m;
    data['windspeed_80m'] = windspeed80m;
    data['windspeed_120m'] = windspeed120m;
    data['windspeed_180m'] = windspeed180m;
    data['temperature_80m'] = temperature80m;
    data['temperature_120m'] = temperature120m;
    data['temperature_180m'] = temperature180m;
    return data;
  }
}

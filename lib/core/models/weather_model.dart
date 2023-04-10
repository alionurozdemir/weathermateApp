import 'package:weather_mate/core/base/base_model.dart';

class WeaterModel extends BaseModel<WeaterModel>{
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
    hourlyUnits =
        json['hourly_units'] != null ? new HourlyUnits.fromJson(json['hourly_units']) : null;
    hourly = json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    data['elevation'] = this.elevation;
    if (this.hourlyUnits != null) {
      data['hourly_units'] = this.hourlyUnits!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.toJson();
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
  String? dewpoint2m;
  String? apparentTemperature;
  String? precipitationProbability;

  HourlyUnits(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.dewpoint2m,
      this.apparentTemperature,
      this.precipitationProbability});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    relativehumidity2m = json['relativehumidity_2m'];
    dewpoint2m = json['dewpoint_2m'];
    apparentTemperature = json['apparent_temperature'];
    precipitationProbability = json['precipitation_probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    data['relativehumidity_2m'] = this.relativehumidity2m;
    data['dewpoint_2m'] = this.dewpoint2m;
    data['apparent_temperature'] = this.apparentTemperature;
    data['precipitation_probability'] = this.precipitationProbability;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<num>? temperature2m;
  List<num>? relativehumidity2m;
  List<num>? dewpoint2m;
  List<num>? apparentTemperature;
  List<num>? precipitationProbability;

  Hourly(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.dewpoint2m,
      this.apparentTemperature,
      this.precipitationProbability});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = (json['time'] as List?)?.map((e) => "$e").toList();
    temperature2m =
        (json['temperature_2m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    relativehumidity2m = (json['relativehumidity_2m'] as List?)
        ?.map((e) => num.tryParse(e.toString()) ?? 0)
        .toList();
    dewpoint2m =
        (json['dewpoint_2m'] as List?)?.map((e) => num.tryParse(e.toString()) ?? 0).toList();
    apparentTemperature = (json['apparent_temperature'] as List?)
        ?.map((e) => num.tryParse(e.toString()) ?? 0)
        .toList();
    precipitationProbability = (json['precipitation_probability'] as List?)
        ?.map((e) => num.tryParse(e.toString()) ?? 0)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    data['relativehumidity_2m'] = this.relativehumidity2m;
    data['dewpoint_2m'] = this.dewpoint2m;
    data['apparent_temperature'] = this.apparentTemperature;
    data['precipitation_probability'] = this.precipitationProbability;
    return data;
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_mate/core/init/functions/weather_service.dart';
import 'package:weather_mate/core/models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeaterModel? weatherList = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String _locationMessage = "";

  Future<void> _getCurrentLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

    weatherList =
        await WeatherService.instance.getCurrentWeather(position.latitude, position.longitude);

    setState(() {});

    weatherList!.hourly?.temperature2m!.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weathermate"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Your location information:"),
          Text(_locationMessage),
          ElevatedButton(
            onPressed: () {
              _getCurrentLocation();
            },
            child: const Text("Access Your Location"),
          ),
          if (weatherList == null)
            const CircularProgressIndicator()
          else
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(weatherList!.hourly!.temperature2m![index].toString()),
                  subtitle: Text(DateFormat('dd/MM/yyyy HH:mm')
                      .format(DateTime.parse(weatherList!.hourly!.time![index]))
                      .toString()
                      .toString()),
                ),
              ),
            )
        ],
      ),
    );
  }
}

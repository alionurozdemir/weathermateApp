import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_mate/core/init/functions/weather_service.dart';
import 'package:weather_mate/core/models/weather_model.dart';

import '../../../core/init/functions/time_functions.dart';
import '../widgets/card_label_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeaterModel? weatherList;
  bool locationVisible = true;
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
    locationVisible = false;
    setState(() {});
  }

  List<DateTime> get todaysTimeStamps {
    return weatherList!.hourly!.time!
        .where((timeStamp) => DateTime.parse(timeStamp).day == DateTime.now().day)
        .map((timeStamp) => DateTime.parse(timeStamp))
        .toList();
  }

  Text? windSpeed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/greyBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: locationVisible,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/images/locationIcon.png",
                        height: 300,
                      ),
                      const Text("Your location information:"),
                      Text(_locationMessage),
                      ElevatedButton(
                        onPressed: () {
                          _getCurrentLocation();
                        },
                        child: const Text("Access Your Location"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                weatherList == null
                    ? const Center(child: SizedBox())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: todaysTimeStamps.length,
                          itemBuilder: (context, index) {
                            var time = todaysTimeStamps[index];

                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                height: 300,
                                width: 100,
                                child: Column(children: [
                                  CardLabel(
                                      imagePath: "assets/images/time.png",
                                      text: "Time",
                                      data: formatDateTime(time).toString()),
                                  CardLabel(
                                      imagePath: "assets/images/temperature.png",
                                      text: "Temperature",
                                      data: weatherList!.hourly!.temperature2m![index].toString()),
                                  CardLabel(
                                      imagePath: "assets/images/apparenttemperature.png",
                                      text: "Apparen Temperature",
                                      data: weatherList!.hourly!.apparentTemperature![index]
                                          .toString()),
                                  CardLabel(
                                      imagePath: "assets/images/probabilityicon3d.png",
                                      text: "Precipitation Probability",
                                      data: weatherList!.hourly!.precipitationProbability![index]
                                          .toString())
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:app_tempo/services/location.dart';
import 'package:app_tempo/services/networking.dart';
import 'package:app_tempo/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app_tempo/services/weather.dart';

const apiKey = '4628758ad918bf2860879ec3735f6b23';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  void pushToLocationScreen(dynamic weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(localWeatherData: weatherData);
    }));
  }

  void getData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    pushToLocationScreen(weatherData);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}

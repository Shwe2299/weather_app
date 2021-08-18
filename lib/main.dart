import 'package:flutter/material.dart';
import 'package:weather_app/global/functions/media_query.dart';
import 'package:weather_app/services/weather_api/weather_api.dart';
import 'package:weather_app/services/weather_api/weather_model.dart';

import 'pages/weather_home/views/weather_home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  late Future<WeatherInfo> futureWeather;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);

    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            WeatherInfo weatherInfo = snapshot.data;
            return WeatherView(
                screenSize: screenSize, weatherInfo: weatherInfo);
          } else if (snapshot.hasError) {
            return Center(
              child: Container(
                child: Text("${snapshot.error}"),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

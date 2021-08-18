import 'package:flutter/material.dart';
import 'package:weather_app/global/functions/media_query.dart';
import 'package:weather_app/global/widgets/weather_tile.dart';
import 'package:weather_app/services/weather_api/weather_model.dart';

double kToC(double kelValue) {
  double celVal = (kelValue - 273.15);
  return celVal;
}

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
    required this.screenSize,
    required this.weatherInfo,
  }) : super(key: key);

  final ScreenSize screenSize;
  final WeatherInfo weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenSize.screenHeight() / 2,
          width: screenSize.screenWidth(),
          color: Color(0xfff1f1f1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherInfo.location,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  kToC(weatherInfo.temp).toString() + "°",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Text(
                "High of ${kToC(weatherInfo.temMax)}°, low of ${kToC(weatherInfo.temMin)}°",
                style: TextStyle(
                    color: Color(0xff9e9e9e),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                WeatherTile(
                  icon: Icons.thermostat_outlined,
                  title: "Temperature",
                  subtitle: "${kToC(weatherInfo.temp)} °C",
                ),
                WeatherTile(
                  icon: Icons.filter_drama_outlined,
                  title: "Weather",
                  subtitle: weatherInfo.weather,
                ),
                WeatherTile(
                  icon: Icons.wb_sunny,
                  title: "Humidity",
                  subtitle: "${weatherInfo.humidity}%",
                ),
                WeatherTile(
                  icon: Icons.waves_outlined,
                  title: "Wind Speed",
                  subtitle: weatherInfo.windSpeed.toString() + "MPH",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:convert';

class WeatherInfo {
  final String location;
  final double temp;
  final double temMin;
  final double temMax;
  final String weather;
  final int humidity;
  final double windSpeed;
  WeatherInfo({
    required this.location,
    required this.temp,
    required this.temMin,
    required this.temMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherInfo.fromMap(Map<String, dynamic> map) {
    return WeatherInfo(
      location: map['name'],
      temp: map["main"]['temp'],
      temMin: map["main"]['temMin'],
      temMax: map["main"]['temMax'],
      weather: map['weather'][0]["description"],
      humidity: map["main"]['humidity'],
      windSpeed: map["wind"]['speed'],
    );
  }

  factory WeatherInfo.fromJson(String source) =>
      WeatherInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherInfo(location: $location, temp: $temp, temMin: $temMin, temMax: $temMax, weather: $weather, humidity: $humidity, windSpeed: $windSpeed)';
  }
}

import 'package:http/http.dart' as http;
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/services/weather_api/weather_model.dart';

Future<WeatherInfo> fetchWeather() async {
  final requestUrl =
      "https://api.openweathermap.org/data/2.5/weather?id=1880252&appid=$WEATHER_API_KEY";

  final response = await http.get(Uri.parse(requestUrl));
  //200 is code for OK
  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(response.body);
  } else {
    throw Exception("Error loading API!");
  }
}

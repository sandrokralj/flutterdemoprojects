import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/forecast.dart';

abstract class WeatherApi {
  Future<Forecast> getWeather(Location location);
  Future<Location> getLocation(String city);
}
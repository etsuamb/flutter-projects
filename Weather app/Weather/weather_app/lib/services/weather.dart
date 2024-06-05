import 'package:weather_app/services/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/services/networking.dart';

const apiPrefix = 'https://api.openweathermap.org/data/2.5/weather';
const apiId = 'fce8022714501e39c8fade7511183d13';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
      NetworkHelper networkHelper = NetworkHelper(
          url:
              '$apiPrefix?q=$cityName&appid=$apiId&units=metric');
      var weatherData = await networkHelper.getData();
      return weatherData;
    
  }
  Future<dynamic> getWeather() async {
    PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      Location location = Location();
      await location.getCurrentLocation();
      NetworkHelper networkHelper = NetworkHelper(
          url:
              '$apiPrefix?lat=${location.latitude}&lon=${location.longitude}&appid=$apiId&units=metric');
      var weatherData = await networkHelper.getData();
      return weatherData;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

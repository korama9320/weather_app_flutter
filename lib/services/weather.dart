import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    ApiCalls apiCalls = ApiCalls(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=21ce8cad5daf9c4330138fa80bb819e8&units=metric');

    var data = await apiCalls.getData();
    return data;
  }

  Future<dynamic> getCityWeather(String city) async {
    Location location = Location();
    await location.getCurrentLocation();
    ApiCalls apiCalls = ApiCalls(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=21ce8cad5daf9c4330138fa80bb819e8&units=metric');

    var data = await apiCalls.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}

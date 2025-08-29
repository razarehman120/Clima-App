import 'location.dart';
import 'networking.dart';

const apiKey = 'c3683238db72b55c4437ab65ffbbc16b';

class WeatherModel {
  void getCityWeather(String cityName) {
    var url= 'openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
  }

  double? longitude;
  double? latitude;


  Future<dynamic> getlocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b6907d289e10d714a6e88b30761fae22');
    var weatherData = await networkHelper.getData();
    return weatherData;
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

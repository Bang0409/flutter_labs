import 'location.dart';
import 'network.dart';

class WeatherModel {
  static const String apiKey = 'YOUR_API_KEY';

  static const String openWeatherMapURL =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      return null;
    }

    String url =
        '$openWeatherMapURL'
        '?lat=${location.latitude}'
        '&lon=${location.longitude}'
        '&appid=$apiKey'
        '&units=metric'
        '&lang=vi';

    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url =
        '$openWeatherMapURL'
        '?q=${Uri.encodeComponent(cityName)}'
        '&appid=$apiKey'
        '&units=metric'
        '&lang=vi';

    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
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
}
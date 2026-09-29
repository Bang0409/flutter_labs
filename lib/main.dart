import 'package:flutter/material.dart';
import 'weather_model.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherModel weatherModel = WeatherModel();
  final TextEditingController cityController = TextEditingController();

  String cityName = 'Đang tải...';
  String country = '';
  String description = '';
  String weatherIcon = '🌤️';

  int temperature = 0;
  int feelsLike = 0;
  int humidity = 0;
  int minTemp = 0;
  int maxTemp = 0;

  double windSpeed = 0;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  Future<void> getLocationWeather() async {
    setState(() {
      isLoading = true;
    });

    var weatherData = await weatherModel.getLocationWeather();
    updateUI(weatherData);
  }

  Future<void> searchCity() async {
    String city = cityController.text.trim();

    if (city.isEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    var weatherData = await weatherModel.getCityWeather(city);
    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      setState(() {
        cityName = 'Không tìm thấy';
        country = '';
        description = 'Vui lòng thử lại';
        weatherIcon = '❌';

        temperature = 0;
        feelsLike = 0;
        humidity = 0;
        minTemp = 0;
        maxTemp = 0;
        windSpeed = 0;

        isLoading = false;
      });
      return;
    }

    double temp =
    (weatherData['main']['temp'] as num).toDouble();

    double feels =
    (weatherData['main']['feels_like'] as num).toDouble();

    double min =
    (weatherData['main']['temp_min'] as num).toDouble();

    double max =
    (weatherData['main']['temp_max'] as num).toDouble();

    double wind =
    (weatherData['wind']['speed'] as num).toDouble();

    int weatherHumidity =
    (weatherData['main']['humidity'] as num).toInt();

    int condition =
    (weatherData['weather'][0]['id'] as num).toInt();

    String apiCityName = weatherData['name'].toString();

    // Chuẩn hóa tên Đà Nẵng nếu API trả tên không đẹp.
    if (apiCityName.toLowerCase().contains('nang')) {
      apiCityName = 'Đà Nẵng';
    }

    setState(() {
      temperature = temp.round();
      feelsLike = feels.round();
      minTemp = min.round();
      maxTemp = max.round();

      humidity = weatherHumidity;
      windSpeed = wind;

      cityName = apiCityName;
      country = weatherData['sys']['country']?.toString() ?? '';

      description =
          weatherData['weather'][0]['description'].toString();

      weatherIcon =
          weatherModel.getWeatherIcon(condition);

      isLoading = false;
    });
  }

  Widget informationCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        height: 85,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.lightBlue,
              size: 28,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Tiêu đề giống mẫu
              const SizedBox(height: 10),

              const Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17213C),
                ),
              ),

              const SizedBox(height: 30),

              // Search
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tên thành phố',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onSubmitted: (_) => searchCity(),
                    ),
                  ),

                  const SizedBox(width: 10),

                  SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: searchCity,
                      icon: const Icon(
                        Icons.search,
                        size: 18,
                      ),
                      label: const Text('Search'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.lightBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // GPS
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: getLocationWeather,
                  tooltip: 'Vị trí hiện tại',
                  icon: const Icon(
                    Icons.my_location,
                    color: Colors.lightBlue,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: CircularProgressIndicator(),
                )
              else ...[
                // Thành phố
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        country.isEmpty
                            ? cityName
                            : '$cityName, $country',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17213C),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // Icon thời tiết
                Text(
                  weatherIcon,
                  style: const TextStyle(
                    fontSize: 85,
                  ),
                ),

                const SizedBox(height: 5),

                // Mô tả
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                // Nhiệt độ
                Text(
                  '$temperature°C',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17213C),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Feels like $feelsLike°C',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),

                const SizedBox(height: 35),

                // Humidity + Wind
                Row(
                  children: [
                    informationCard(
                      icon: Icons.water_drop,
                      title: 'Humidity',
                      value: '$humidity%',
                    ),

                    const SizedBox(width: 12),

                    informationCard(
                      icon: Icons.air,
                      title: 'Wind Speed',
                      value:
                      '${windSpeed.toStringAsFixed(2)} m/s',
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Min + Max
                Row(
                  children: [
                    informationCard(
                      icon: Icons.thermostat,
                      title: 'Min Temp',
                      value: '$minTemp°C',
                    ),

                    const SizedBox(width: 12),

                    informationCard(
                      icon: Icons.thermostat,
                      title: 'Max Temp',
                      value: '$maxTemp°C',
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
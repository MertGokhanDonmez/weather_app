import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            if (weatherProvider.weather == null) {
              // Veri bekleniyor ise gösterilecek widget
              return CircularProgressIndicator();
            } else {
              WeatherModel weather = weatherProvider.weather!;

              // İstediğiniz şekilde UI oluşturun, aşağıda basit bir örnek var:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sıcaklık: ${weather.temperature} K'),
                  Text('Hissedilen Sıcaklık: ${weather.feelsLike} K'),
                  // Diğer hava durumu bilgilerini ekleyin...
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

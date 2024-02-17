import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:icons_flutter/icons_flutter.dart';

class MiniCard extends StatelessWidget {
  final IconData cardIcon;
  final String title;
  final String data;

  const MiniCard(this.cardIcon, this.title, this.data, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherInfo = context.read<WeatherProvider>();
    return Card(
      color: Color.fromARGB(149, 0, 0, 0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              cardIcon,
              size: 30,
              color: Color.fromARGB(255, 237, 178, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              data,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

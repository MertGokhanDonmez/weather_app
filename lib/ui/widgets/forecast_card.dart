import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:weather_app/data/models/forecast_list_item_model.dart';

class ForecastCard extends StatefulWidget {
  final ListItemModel forecast;

  ForecastCard({required this.forecast});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    final String hour = DateTime.parse(widget.forecast.dateTime)
        .hour
        .toString()
        .padLeft(2, '0');
    String weatherState = widget.forecast.weather[0].main.toLowerCase();
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            hour,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            getIcon(weatherState),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${widget.forecast.main.temperature!.round()}°C',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

IconData getIcon(String weatherState) {
  // hava durumu bilgisi baslik olarak alinmistir, gelistirme surecinde api deki 'description' alanindan detaylar alinabilir
  switch (weatherState) {
    case 'clear':
      return FlutterIcons.wi_day_sunny_wea;
    case 'rain':
      return FlutterIcons.wi_showers_wea;
    case 'snow':
      return FlutterIcons.wi_day_sunny_wea;
    case 'clouds':
      return FlutterIcons.wi_day_sunny_wea;
    case 'wind':
      return FlutterIcons.wi_windy_wea;
    default:
      return FlutterIcons.wi_na_wea;
  }
}

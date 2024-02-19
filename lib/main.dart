import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/themes/main_theme.dart';
import 'package:weather_app/ui/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: HomePage(),
    );
  }
}

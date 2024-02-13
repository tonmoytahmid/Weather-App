// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/weather_model.dart';
import 'package:flutter_application_1/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherservice = weatherservice('aa5cb9e2061509e393d96ea835e5aaf3');
  weather? _weather;

  _fatchweather() async {
    String Cityname = await _weatherservice.getcurrentCity();
    try {
      final weather = await _weatherservice.getweather(Cityname);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fatchweather(); // Add this line to invoke the method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.Cityname ?? "loading",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Text("${_weather?.tempareture ?? 'N/A'}*C",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

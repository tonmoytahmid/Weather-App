// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter_application_1/Model/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class weatherservice {
  String apikye;
  weatherservice(this.apikye);
  final BaseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  Future<weather> getweather(String Cityname) async {
    final response = await http
        .get(Uri.parse('$BaseUrl&q=$Cityname&appid=$apikye&units=metric'));
    if (response.statusCode == 200) {
      return weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Faild to load data");
    }
  }

  Future<String> getcurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemark[0].locality;
    return city ?? "";
  }
}

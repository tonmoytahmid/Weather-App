

class weather {
  String Cityname;
  String tempareture;
  String Maincondition;
  weather(
      {required this.Cityname,
      required this.tempareture,
      required this.Maincondition});

  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(
        Cityname: json['name'],
        tempareture: json['main']['temp'].toString(),
        Maincondition: json['weather'][0]['main']);
  }
}

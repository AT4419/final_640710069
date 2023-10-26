/*
  {
    "city": "Seoul",
    "country": "South Korea",
    "lastUpdated": "2023-10-26 11:30",
    "tempC": 20,
    "tempF": 68,
    "feelsLikeC": 20,
    "feelsLikeF": 68,
    "windKph": 15.1,
    "windMph": 9.4,
    "humidity": 73,
    "uv": 4,
    "condition": {
        "text": "Mist",
        "icon": "https://cdn.weatherapi.com/weather/128x128/day/143.png",
        "code": 1030
  },
*/

class Item {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  final String condition;
  final String text;
  final String icon;
  final String code;

  Item(
      {required this.city,
      required this.country,
      required this.lastUpdated,
      required this.tempC,
      required this.tempF,
      required this.feelsLikeC,
      required this.feelsLikeF,
      required this.windKph,
      required this.windMph,
      required this.humidity,
      required this.uv,
      required this.condition,
      required this.text,
      required this.icon,
      required this.code});

  factory Item.fromJson(Map<String, dynamic> json) {
    //factory constructor
    return Item(
      city: json['city'],
      country: json['country'],
      lastUpdated: json['lastUpdated'],
      tempC: json['tempC'],
      tempF: json['tempF'],
      feelsLikeC: json['feelsLikeC'],
      feelsLikeF: json['feelsLikeF'],
      windKph: json['windKph'],
      windMph: json['windMph'],
      humidity: json['humidity'],
      uv: json['uv'],
      condition: json['condition'],
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<Item>? _itemList;
  // Map<String, Item>? _itemList;
  String? _error;

  void getTodo() async {
    try {
      setState(() {
        _error = null;
      });

      // await Future.delayed(const Duration(seconds: 3), () {});

      final response = await _dio.get(
          'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=korea');
      debugPrint(response.data.toString());
      // parse
      List list = jsonDecode(response.data.toString());
      setState(() {
        _itemList = list.map((item) => Item.fromJson(item)).toList();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('เกิดข้อผิดพลาด: ${e.toString()}');
    }
  }

  @override //do it one time
  void initState() {
    super.initState();
    getTodo();
  }

  @override
  Widget build(BuildContext context) {
    // Widget body = ListView.builder(
    //       itemCount: _itemList!.length,
    //       itemBuilder: (context, index) {
    // var doItem = _itemList![index];
    // var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 237, 242),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Bangkok',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  Text('Korea',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24)),
                  Text('Ratchaburi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24)),
                ],
              ),
              Text(
                'Seoul',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ), //city
              Text(
                'South Korea',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ), //country
              Text(
                '2023-10-26 11.30',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ), //lastUpdated
              Icon(
                Icons.cloud,
                color: const Color.fromARGB(255, 77, 77, 77),
                size: 100,
              ), //icon
              Text(
                'Mist',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ), //text
              Text(
                '20',
                style: TextStyle(fontSize: 60),
                textAlign: TextAlign.center,
              ), //tempC
              Text(
                'Feels like 20',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ), //feelsLikeC
              Text(
                'C | F',
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.water_drop),
                      Text(
                        'HUMIDITY',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '73',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.air),
                      Text(
                        'WIND',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '15.1 kn/h',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.light_mode),
                      Text(
                        'UV',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '4',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //});
  }
}

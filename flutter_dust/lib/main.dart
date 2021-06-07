import 'package:flutter/material.dart';

import 'model/air_visual_model.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AirVisualModel? _result = AirVisualModel();

  Future<AirVisualModel> fetchData() async {
    var response = await http.get(Uri(
        scheme: 'https',
        host: 'api.airvisual.com',
        port: 443,
        path: '/v2/nearest_city',
        queryParameters: {'key': '41e9caa7-4cd2-401d-a9c0-1138b4766c3e'}));

    AirVisualModel result = AirVisualModel.fromJson(json.decode(response.body));
    return result;
  }

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        _result = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _result == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '현재 위치 미세먼지',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('aa'),
                                Text(
                                  '${_result?.data?.current?.pollution?.aqius ?? 0}',
                                  style: TextStyle(fontSize: 40),
                                ),
                                Text(
                                  _getString(_result),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            color: _getColor(_result),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text('이미지'),
                                    SizedBox(
                                        width: 40,
                                        child: Text(
                                          '${_result?.data?.current?.weather?.tp ?? 0}도',
                                          style: TextStyle(fontSize: 16),
                                        )),
                                  ],
                                ),
                                Text(
                                    '습도 ${_result?.data?.current?.weather?.hu ?? 0}%'),
                                Text(
                                    '풍속 ${_result?.data?.current?.weather?.ws ?? 0.0}m/s'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.refresh),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 50)),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Color _getColor(AirVisualModel? result) {
    if (_result?.data?.current?.pollution?.aqius != null) {
      int temp = _result!.data!.current!.pollution!.aqius!;

      if (temp <= 50) {
        return Colors.greenAccent;
      } else if (temp <= 100) {
        return Colors.yellow;
      } else if (temp <= 150) {
        return Colors.orange;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }

  String _getString(AirVisualModel? result) {
    if (_result?.data?.current?.pollution?.aqius != null) {
      int temp = _result!.data!.current!.pollution!.aqius!;

      if (temp <= 50) {
        return '좋음';
      } else if (temp <= 100) {
        return '보통';
      } else if (temp <= 150) {
        return '나쁨';
      } else {
        return '최악';
      }
    } else {
      return '모름';
    }
  }
}

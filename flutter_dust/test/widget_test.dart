// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_dust/model/air_visual_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  test('http 통신 테스트', () async {
    var response = await http.get(Uri(
        scheme: 'https',
        host: 'api.airvisual.com',
        port: 443,
        path: '/v2/nearest_city',
        queryParameters: {'key': '41e9caa7-4cd2-401d-a9c0-1138b4766c3e'}));

    expect(response.statusCode, 200);

    AirVisualModel result = AirVisualModel.fromJson(json.decode(response.body));
    expect(result.status, 'success');
  });
}

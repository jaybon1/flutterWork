
import 'package:flutter_dust/model/air_visual_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class AirBloc{

  final _airVisualModelSubject = BehaviorSubject<AirVisualModel>();

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

  AirBloc() {
    fetch();
  }

  void fetch() async {
    print("refresh");
    _airVisualModelSubject.add(await fetchData());
  }

  Stream<AirVisualModel> get airVisualModel$ => _airVisualModelSubject.stream;

}
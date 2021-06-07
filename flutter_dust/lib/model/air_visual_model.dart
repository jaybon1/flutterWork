/// status : "success"
/// data : {"city":"Yongsan-dong","state":"Seoul","country":"South Korea","location":{"type":"Point","coordinates":[126.990597,37.532171]},"current":{"weather":{"ts":"2021-06-07T09:00:00.000Z","tp":23,"pr":1014,"hu":57,"ws":1.03,"wd":360,"ic":"04d"},"pollution":{"ts":"2021-06-07T09:00:00.000Z","aqius":63,"mainus":"p2","aqicn":46,"maincn":"n2"}}}

class AirVisualModel {
  String? _status;
  Data? _data;

  String? get status => _status;
  Data? get data => _data;

  AirVisualModel({
      String? status, 
      Data? data}){
    _status = status;
    _data = data;
}

  AirVisualModel.fromJson(dynamic json) {
    _status = json["status"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }

}

/// city : "Yongsan-dong"
/// state : "Seoul"
/// country : "South Korea"
/// location : {"type":"Point","coordinates":[126.990597,37.532171]}
/// current : {"weather":{"ts":"2021-06-07T09:00:00.000Z","tp":23,"pr":1014,"hu":57,"ws":1.03,"wd":360,"ic":"04d"},"pollution":{"ts":"2021-06-07T09:00:00.000Z","aqius":63,"mainus":"p2","aqicn":46,"maincn":"n2"}}

class Data {
  String? _city;
  String? _state;
  String? _country;
  Location? _location;
  Current? _current;

  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  Location? get location => _location;
  Current? get current => _current;

  Data({
      String? city, 
      String? state, 
      String? country, 
      Location? location, 
      Current? current}){
    _city = city;
    _state = state;
    _country = country;
    _location = location;
    _current = current;
}

  Data.fromJson(dynamic json) {
    _city = json["city"];
    _state = json["state"];
    _country = json["country"];
    _location = json["location"] != null ? Location.fromJson(json["location"]) : null;
    _current = json["current"] != null ? Current.fromJson(json["current"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["city"] = _city;
    map["state"] = _state;
    map["country"] = _country;
    if (_location != null) {
      map["location"] = _location?.toJson();
    }
    if (_current != null) {
      map["current"] = _current?.toJson();
    }
    return map;
  }

}

/// weather : {"ts":"2021-06-07T09:00:00.000Z","tp":23,"pr":1014,"hu":57,"ws":1.03,"wd":360,"ic":"04d"}
/// pollution : {"ts":"2021-06-07T09:00:00.000Z","aqius":63,"mainus":"p2","aqicn":46,"maincn":"n2"}

class Current {
  Weather? _weather;
  Pollution? _pollution;

  Weather? get weather => _weather;
  Pollution? get pollution => _pollution;

  Current({
      Weather? weather, 
      Pollution? pollution}){
    _weather = weather;
    _pollution = pollution;
}

  Current.fromJson(dynamic json) {
    _weather = json["weather"] != null ? Weather.fromJson(json["weather"]) : null;
    _pollution = json["pollution"] != null ? Pollution.fromJson(json["pollution"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_weather != null) {
      map["weather"] = _weather?.toJson();
    }
    if (_pollution != null) {
      map["pollution"] = _pollution?.toJson();
    }
    return map;
  }

}

/// ts : "2021-06-07T09:00:00.000Z"
/// aqius : 63
/// mainus : "p2"
/// aqicn : 46
/// maincn : "n2"

class Pollution {
  String? _ts;
  int? _aqius;
  String? _mainus;
  int? _aqicn;
  String? _maincn;

  String? get ts => _ts;
  int? get aqius => _aqius;
  String? get mainus => _mainus;
  int? get aqicn => _aqicn;
  String? get maincn => _maincn;

  Pollution({
      String? ts, 
      int? aqius, 
      String? mainus, 
      int? aqicn, 
      String? maincn}){
    _ts = ts;
    _aqius = aqius;
    _mainus = mainus;
    _aqicn = aqicn;
    _maincn = maincn;
}

  Pollution.fromJson(dynamic json) {
    _ts = json["ts"];
    _aqius = json["aqius"];
    _mainus = json["mainus"];
    _aqicn = json["aqicn"];
    _maincn = json["maincn"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ts"] = _ts;
    map["aqius"] = _aqius;
    map["mainus"] = _mainus;
    map["aqicn"] = _aqicn;
    map["maincn"] = _maincn;
    return map;
  }

}

/// ts : "2021-06-07T09:00:00.000Z"
/// tp : 23
/// pr : 1014
/// hu : 57
/// ws : 1.03
/// wd : 360
/// ic : "04d"

class Weather {
  String? _ts;
  int? _tp;
  int? _pr;
  int? _hu;
  double? _ws;
  int? _wd;
  String? _ic;

  String? get ts => _ts;
  int? get tp => _tp;
  int? get pr => _pr;
  int? get hu => _hu;
  double? get ws => _ws;
  int? get wd => _wd;
  String? get ic => _ic;

  Weather({
      String? ts, 
      int? tp, 
      int? pr, 
      int? hu, 
      double? ws, 
      int? wd, 
      String? ic}){
    _ts = ts;
    _tp = tp;
    _pr = pr;
    _hu = hu;
    _ws = ws;
    _wd = wd;
    _ic = ic;
}

  Weather.fromJson(dynamic json) {
    _ts = json["ts"];
    _tp = json["tp"];
    _pr = json["pr"];
    _hu = json["hu"];
    _ws = json["ws"];
    _wd = json["wd"];
    _ic = json["ic"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ts"] = _ts;
    map["tp"] = _tp;
    map["pr"] = _pr;
    map["hu"] = _hu;
    map["ws"] = _ws;
    map["wd"] = _wd;
    map["ic"] = _ic;
    return map;
  }

}

/// type : "Point"
/// coordinates : [126.990597,37.532171]

class Location {
  String? _type;
  List<double>? _coordinates;

  String? get type => _type;
  List<double>? get coordinates => _coordinates;

  Location({
      String? type, 
      List<double>? coordinates}){
    _type = type;
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    _type = json["type"];
    _coordinates = json["coordinates"] != null ? json["coordinates"].cast<double>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["coordinates"] = _coordinates;
    return map;
  }

}
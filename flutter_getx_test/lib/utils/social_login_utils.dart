import 'dart:convert';

import 'package:flutter_getx_test/dto/social_code_dto.dart';
import 'package:http/http.dart' as http;

class SocialLoginUtils {
  static Future<http.Response> loginCheck(SocialCodeDTO socialLoginDTO) async {
    return await http.post(
      Uri(
          scheme: "http",
          host: "192.168.0.69",
          port: 8080,
          path: "oauth/loginCheck"),
      body: json.encode(socialLoginDTO),
      headers: <String, String>{
        'Accept' : 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}

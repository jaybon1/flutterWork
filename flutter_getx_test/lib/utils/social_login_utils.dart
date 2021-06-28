import 'dart:convert';

import 'package:flutter_getx_test/dto/social_code_dto.dart';
import 'package:flutter_getx_test/dto/social_login_dto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SocialLoginUtils extends GetConnect {

  static SocialLoginUtils? _instance;

  SocialLoginUtils._();

  static SocialLoginUtils get getInstance => _instance ??= SocialLoginUtils._();

  Future<Response> test(String accessToken) => get(
        "https://openapi.naver.com/v1/nid/me",
        headers: <String, String>{
          'Authorization': 'Bearer $accessToken',
          'Content-Encoding': 'utf-8',
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=euc-kr',
        },
      );


  static Future<http.Response> loginCheck(SocialLoginDTO socialLoginDTO) async {
    return await http.post(
      Uri(
          scheme: "http",
          host: "192.168.0.69",
          port: 8080,
          path: "oauth/loginCheck"),
      body: json.encode(socialLoginDTO),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppLocalizationsRepository {

  Future<Map<String, dynamic>> getAppLocalizations(String cep) async {
    final Uri url = Uri.parse('saloma api get');
    final client = http.Client();
    final response = await client.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    
    final body = json.decode(response.body);

    debugPrint(body);

    //  return AppLocalizationsModel.fromJson(body);

    return body;
  }

  Future<Map<String, dynamic>> setStringAppLocalizations() async {
    final Uri url = Uri.parse('saloma api post');
    var response = await http.post(
      url, 
      body: {},
    );
    final responseBody = jsonDecode(response.body);
    
    debugPrint(responseBody);

    return responseBody;
  }
   
}
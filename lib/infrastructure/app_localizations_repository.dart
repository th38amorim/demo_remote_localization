import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AppLocalizationsRepository {

  Future<List<dynamic>> getAppLocalizations() async {
    final Uri url = Uri.parse('https://stark.leftbank.app/api/v1/mark-i/location/app-leftbank/1');
    final client = http.Client();
    final response = await client.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    
    final Map<String, dynamic> body = json.decode(utf8.decode(response.bodyBytes));

    return body['dictionary'];
  }
   
}
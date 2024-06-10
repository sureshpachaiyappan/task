import 'dart:async';
import 'dart:convert';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:http/http.dart' as http;
import 'package:task/utils/keychain_store.dart';

class ApiService {
  static const baseurl = 'https://api.yelp.com/';

  static Future<Map<String, dynamic>> get(String endpoint) async {
    await KeyChain.saveToken();
    var valueToken = await FlutterKeychain.get(key: "token");
    final response = await http.get(
      Uri.parse('$baseurl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':valueToken??''},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // You can add other methods for POST, PUT, DELETE, etc.
}

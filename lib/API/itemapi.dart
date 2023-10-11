import 'dart:async';
import 'package:http/http.dart' as http;

class ItemAPI{
      static Future<http.Response> getItems() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/item?limit=953"));
} 
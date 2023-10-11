import 'dart:async';
import 'package:http/http.dart' as http;

class BerryAPI{
      static Future<http.Response> getBerries() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/berry?limit=63"));
} 
import 'dart:async';
import 'package:http/http.dart' as http;

class MoveAPI{
      static Future<http.Response> getMoves() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/move?limit=921"));
} 
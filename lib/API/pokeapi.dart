import 'dart:async';
import 'package:http/http.dart' as http;

class PokeAPI {
  static Future<http.Response> getPokemon() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151"));
      
  static Future<http.Response> getMoves() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/move?limit=1000"));
}
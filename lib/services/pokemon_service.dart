import 'dart:convert';

import 'package:pokemon_search_api/models/pokemon.dart';
import 'package:http/http.dart' as http;


class PokemonService {
  static const base = "https://pokeapi.co/api/v2/pokemon";
  
  Future<Pokemon> getPokemon(String pokeName) async {
    final response = await http.get(Uri.parse("$base/$pokeName"));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load Pokemon data');
    }
  }
}
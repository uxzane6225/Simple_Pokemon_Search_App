import 'package:flutter/material.dart';
import 'package:pokemon_search_api/services/pokemon_service.dart';

class PokemonViewmodel extends ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();


  Future<bool> getPokemon(String pokemonName) async {
    if (pokemonName.isEmpty) {
      return false;
    }

    try {
      await _pokemonService.getPokemon(pokemonName);

      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
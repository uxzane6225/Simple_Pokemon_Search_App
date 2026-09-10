import 'package:flutter/material.dart';
import 'package:pokemon_search_api/models/pokemon.dart';
import 'package:pokemon_search_api/pages/components/result_content.dart';
import 'package:pokemon_search_api/pages/components/sprite_content.dart';
import 'package:pokemon_search_api/services/pokemon_service.dart';

class PokemonPage extends StatefulWidget {
  const new({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final TextEditingController nameController = TextEditingController();

  final _pokemonService = PokemonService();
  Pokemon? _pokemon;

  _fetchPokemon() async {
    String pokemonName = nameController.text.trim();

    if (pokemonName.isEmpty) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Field is Empty!")));
    }

    try {
      final pokemon = await _pokemonService.getPokemon(pokemonName);

      nameController.clear();
      setState(() {
        _pokemon = pokemon;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPokemon();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Search Pokemon",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: .center,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hint: Text("Search Pokemon name"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD3D3D3),
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0.1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FilledButton(
                      onPressed: _fetchPokemon,
                      style: FilledButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Search"),
                    ),
                  ),
                  SizedBox(height: 20),
          
                  //Results
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD3D3D3),
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Result",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.left,
                          ),
          
                          ResultContent(title: "Pokemon ID", content: _pokemon?.id.toString()),
                          ResultContent(title: "Name", content: _pokemon?.name),
                          ResultContent(title: "Base Experience", content: _pokemon?.base_experience.toString()),
                          ResultContent(title: "Height", content: _pokemon?.height.toString()),
                          ResultContent(title: "Order", content: _pokemon?.order.toString()),
                          ResultContent(title: "Weight", content: _pokemon?.weight.toString()),
                          SizedBox(height: 10),
                          SpriteContent(id: _pokemon?.id),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

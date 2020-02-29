import 'package:mobxlearn/PokedexApp/models/pokedex/pokemon.dart';

class PokemonModel {
  List<Pokemon> pokemonList;

  PokemonModel({this.pokemonList});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    
    if (json['pokemon'] != null) {
      pokemonList = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemonList.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonList != null) {
      data['pokemon'] = this.pokemonList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



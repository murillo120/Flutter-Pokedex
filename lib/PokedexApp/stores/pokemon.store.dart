import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mobxlearn/PokedexApp/Consts.dart';
import 'package:mobxlearn/PokedexApp/models/pokedex/pokemon.dart';
import 'package:mobxlearn/PokedexApp/models/pokemonModel.dart';
part 'pokemon.store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {

  
  PokemonModel pokemons;

  @observable
  int page = -1;

  List<Pokemon> newList = List<Pokemon>();
  List<Pokemon> oldList = List<Pokemon>();

  @observable
  var listToset = ObservableList();

  Future getPokemons() async {
    http.Response response = await http.get(Consts.API_URL);
    var data = json.decode(response.body);

    pokemons = PokemonModel.fromJson(data);

    listToset = pokemons.pokemonList.asObservable();

    oldList = pokemons.pokemonList;


    return listToset;
  }

  @action
  void pokemonPage(int pageIndex) {

    page = pageIndex;

    switch (page) {
      case 0:
        print("changed page - 0");
        newList.clear();
        oldList.forEach((pokemon) {
          if (pokemon.type.contains("Grass")) {
            newList.add(pokemon);
            print(pokemon.name);
          }
        });
        listToset = newList.asObservable();
        break;
      case 1:
        print("changed page - 1");
        newList.clear();
        oldList.forEach((pokemon) {
          if (pokemon.type.contains("Fire")) {
            newList.add(pokemon);
            print(pokemon.name);
          }
        });
        listToset = newList.asObservable();
        break;
      case 2:
        print("changed page - 2");
        newList.clear();
        oldList.forEach((pokemon) {
          if (pokemon.type.contains("Water")) {
            newList.add(pokemon);
            print(pokemon.name);
          }
        });
        listToset = newList.asObservable();
        break;

      default:
    }
  }


  @action
  Future refreshPage(){

    page = -1;

    listToset = oldList.asObservable();

    return Future.delayed(Duration(seconds: 1));

  }

  void filterPokemons(String search){

    newList.clear();

    if (search.isEmpty) {
      listToset = oldList.asObservable();
    }



    oldList.forEach((f){
      if(f.name.toLowerCase().contains(search)){
        newList.add(f);

      }
    });

    listToset = newList.asObservable();

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxlearn/PokedexApp/stores/pokemon.store.dart';
import 'package:mobxlearn/PokedexApp/views/PokeCard.dart';
import 'package:provider/provider.dart';

class CustomGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonStore = Provider.of<PokemonStore>(context);

    return FutureBuilder(
      future: pokemonStore.getPokemons(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Divider(
                    color: Color.fromRGBO(150, 50, 50, 1),
                  ),
                  Text(
                    "Loading Pokedex...",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          default:
            return Observer(
              builder: (_) {
                return RefreshIndicator(
                  onRefresh: pokemonStore.refreshPage,
                  child: GridView.builder(
                    itemCount: pokemonStore.listToset.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0),
                    itemBuilder: (context, index) {
                      return PokeCard(pokemonStore.listToset[index]);
                    }),
                );
              },
            );
        }
      },
    );
  }
}

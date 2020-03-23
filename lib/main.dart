import 'package:flutter/material.dart';
import 'package:mobxlearn/PokedexApp/stores/pokemon.store.dart';
import 'package:mobxlearn/ui/base_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(MaterialApp(
  home: MyApp(),
));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: BaseScreen(),
      providers: [
        Provider<PokemonStore>(
          create: (_) => PokemonStore(),
        )
      ],
    );
  }
}
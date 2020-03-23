import 'package:flutter/material.dart';
import 'package:mobxlearn/PokedexApp/models/pokedex/pokemon.dart';

class PokeCardAbout extends StatefulWidget {
  final Pokemon pokemon;
  PokeCardAbout(this.pokemon);

  @override
  _PokeCardAboutState createState() => _PokeCardAboutState(pokemon);
}

class _PokeCardAboutState extends State<PokeCardAbout> {
  final Pokemon pokemon;
  _PokeCardAboutState(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Height: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.height)
                  ]),
              ),
              Divider(),
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Weight: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.weight)
                  ]),
              ),
              Divider(),
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Candy: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.candy)
                  ]),
              ),
              Divider(),
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Candy Count: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.candyCount.toString())
                  ]),
              ),
              Divider(),
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Egg: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.egg)
                  ]),
              ),
              Divider(),
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Spawn Chance: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.spawnChance.toString())
                  ]),
              ),
              Divider(),
              RichText(
                text: TextSpan(style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Spawn Time: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: pokemon.spawnTime)
                  ]),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("Weakness", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              Column(children: generateChips(pokemon.weaknesses))
            ],
          ),
        ],
      ),
    ));
  }

  List<Widget> generateChips(List<String> weakTypes) {
    var chipColor;
    List<Widget> listChips = List<Widget>();

    for (var item in weakTypes) {
      switch (item) {
        case "Grass":
          chipColor = Color.fromRGBO(0, 204, 55, 0.9);
          break;
        case "Fire":
          chipColor = Color.fromRGBO(255, 106, 0, 1);
          break;
        case "Water":
          chipColor = Color.fromRGBO(0, 110, 255, 1);
          break;
        case "Bug":
          chipColor = Color.fromRGBO(0, 204, 112, 1);
          break;
        case "Normal":
          chipColor = Color.fromRGBO(61, 94, 69, 1);
          break;
        case "Fighting":
          chipColor = Color.fromRGBO(255, 0, 0, 1);
          break;
        case "Poison":
          chipColor = Color.fromRGBO(180, 70, 240, 1);
          break;
        case "Ground":
          chipColor = Color.fromRGBO(194, 117, 0, 1);
          break;
        case "Psychic":
          chipColor = Color.fromRGBO(255, 227, 13, 1);
          break;
        case "Electric":
          chipColor = Color.fromRGBO(255, 227, 13, 1);
          break;
        case "Ice":
          chipColor = Color.fromRGBO(70, 232, 250, 1);
          break;
        case "Flying":
          chipColor = Color.fromRGBO(84, 164, 255, 1);
          break;    
      }

      listChips.add(Chip(
        label: Text(item, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: chipColor,
      ));
    }

    return listChips;
  }
}

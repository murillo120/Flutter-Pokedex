import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxlearn/PokedexApp/models/pokedex/pokemon.dart';

class PokeList extends StatelessWidget {
  final Pokemon pokemon;

  PokeList(this.pokemon);

  @override
  Widget build(BuildContext context) {
    var cardColor;
    var chipColor;

    switch (pokemon.type[0]) {
      case "Grass":
        cardColor = Color.fromRGBO(2, 191, 145, 1);
        chipColor = Color.fromRGBO(0, 204, 55, 0.9);
        break;
      case "Fire":
        cardColor = Color.fromRGBO(255, 108, 82, 1);
        chipColor = Color.fromRGBO(255, 106, 0, 1);
        break;
      case "Water":
        cardColor = Color.fromRGBO(59, 167, 255, 1);
        chipColor = Color.fromRGBO(0, 110, 255, 1);
        break;
      case "Bug":
        cardColor = Color.fromRGBO(45, 173, 73, 1);
        chipColor = Color.fromRGBO(0, 204, 112, 1);
        break;
      case "Normal":
        cardColor = Color.fromRGBO(108, 140, 115, 1);
        chipColor = Color.fromRGBO(61, 94, 69, 1);
        break;
      case "Fighting":
        cardColor = Color.fromRGBO(255, 74, 74, 1);
        chipColor = Color.fromRGBO(255, 0, 0, 1);
        break;
      case "Poison":
        cardColor = Color.fromRGBO(91, 33, 122, 1);
        chipColor = Color.fromRGBO(180, 70, 240, 1);
        break;
      case "Ground":
        cardColor = Color.fromRGBO(191, 144, 73, 1);
        chipColor = Color.fromRGBO(194, 117, 0, 1);
        break;
      case "Electric":
        cardColor = Color.fromRGBO(255, 191, 0, 1);
        chipColor = Color.fromRGBO(255, 227, 13, 1);
        break;
    }

    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          height: 200,
          width: 221,
          child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              color: cardColor,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-0.4,1),
                    child: Opacity(
                        opacity: 0.1,
                        child: Image.asset("assets/images/pokeball.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0.8, -1),
                          child: Text(
                            "#${pokemon.num}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          pokemon.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  pokemon.img,
                                  height: 105,
                                  width: 105,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: generateChips(pokemon.type),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  List<Widget> generateChips(List<String> weakTypes) {
    var chipColor;
    List<Widget> listChips = List<Widget>();

    for (var item in weakTypes) {
      if (listChips.length <= 2) {
        
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
    }}

    return listChips;
  }
}

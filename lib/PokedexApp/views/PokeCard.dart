import 'package:flutter/material.dart';
import 'package:mobxlearn/PokedexApp/models/pokedex/pokemon.dart';
import 'package:mobxlearn/PokedexApp/views/PokeCard_evolutions.dart';

import 'PokeCard_about.dart';

class PokeCard extends StatefulWidget {
  final Pokemon pokemon;
  PokeCard(this.pokemon);

  @override
  _PokeCardState createState() => _PokeCardState(this.pokemon);
}

class _PokeCardState extends State<PokeCard>
    with SingleTickerProviderStateMixin {
  final Pokemon pokemon;

  _PokeCardState(this.pokemon);

  var cardColor;
  var chipColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              print("favorited");
            },
          )
        ],
      ),
      bottomSheet: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            Container(
              height: 370,
              color: cardColor,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TabBar(
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              "About",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Base Stats",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Evolution",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 40, right: 40, top: 30),
                              child: PokeCardAbout(pokemon),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 40, right: 40),
                              child: PokeCardEvolutions(),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 40, right: 40),
                              child: PokeCardEvolutions(),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: cardColor,
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 5, 18, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(pokemon.name,
                      style: TextStyle(color: Colors.white, fontSize: 32)),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("#${pokemon.num}",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                  Row(children: generateChips(pokemon.type)),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Opacity(
                            opacity: 0.1,
                            child: Image.asset("assets/images/pokeball.png")),
                        Center(
                          child: Image.network(
                            pokemon.img,
                            height: 120,
                            width: 120,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
        label: Text(
          item,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: chipColor,
      ));
    }

    return listChips;
  }
}

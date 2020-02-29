import 'package:flutter/material.dart';
import 'package:mobxlearn/PokedexApp/stores/pokemon.store.dart';
import 'package:provider/provider.dart';
import 'views/CustomGridView.dart';

class PokedexHome extends StatelessWidget {

  // List<Widget> tabs = [CustomGridView(), LeafType(), FireType(), WaterType()];

  @override
  Widget build(BuildContext context) {

    final pokeStore = Provider.of<PokemonStore>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (pageIndex){
          print("$pageIndex - NavigationBottom");
          pokeStore.pokemonPage(pageIndex);
        },
        backgroundColor: Color.fromRGBO(204, 57, 57,1),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/leaf.png",
                height: 55,
                width: 55,
              ),
              title: Text(
                "Leaf",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/fire.png",
                height: 55,
                width: 55,
              ),
              title: Text("Fire",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/water.png",
                height: 55,
                width: 55,
              ),
              title: Text("Water",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)))
        ],
      ),
      body: Container(
        color: Color.fromRGBO(150, 50, 50, 1),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Pesquise...  ",
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: Container(
                  color: Color.fromRGBO(150, 50, 50, 1),
                  child: CustomGridView()),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxlearn/FinanceApp/homeFinance.dart';
import 'package:mobxlearn/PokedexApp/home.dart';
import 'package:mobxlearn/TodoApp/homeTodo.dart';
import 'package:mobxlearn/stores/drawer/drawer.store.dart';
import 'custom/customDrawer/drawerListItem.dart';

class BaseScreen extends StatelessWidget {
  final thedrawer = MobDrawerStore();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Flutter Apps developed"),
        centerTitle: true,
        actions: <Widget>[

        ],
      ),
      drawer: Drawer(
          child: Observer(
        builder: (_) => Column(
          children: <Widget>[
            Container(
              color: Colors.purple,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "By Murillo Pereira da Silva",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            DrawerListItem(
              icondata: Icons.monetization_on,
              title: "Finance",
              focused: thedrawer.page == 0,
              changePage: () {
                thedrawer.changePage(0);
                pageController.jumpToPage(thedrawer.page);
                print(thedrawer.page);
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icondata: Icons.mode_edit,
              title: "To do List",
              focused: thedrawer.page == 1,
              changePage: () {
                thedrawer.changePage(1);
                pageController.jumpToPage(thedrawer.page);
                Navigator.pop(context);
              },
            ),
            DrawerListItem(
              icondata: Icons.pets,
              title: "Pokedex",
              focused: thedrawer.page == 2,
              changePage: () {
                thedrawer.changePage(2);
                pageController.jumpToPage(thedrawer.page);
                print(thedrawer.page);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )),
      body: Observer(
        builder: (_) => PageView(
          physics:new NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            FinanceApp(),
            TodoHome(),
            PokedexHome()
          ],
        ),
      ),
    );
  }
}

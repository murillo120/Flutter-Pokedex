import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxlearn/FinanceApp/stores/finance.store.dart';

class FinanceApp extends StatelessWidget {
  final finance = MobFinanceStore();

  final brController = TextEditingController();
  final usdController = TextEditingController();
  final euroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Observer(
        builder: (_) => SingleChildScrollView(
          child: FutureBuilder(
            //future: finance.callCurrency(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error loading data :c"),
                );
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                      ),
                      Center(
                        child: Text(
                          "error on loading Data...",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  );
                case ConnectionState.waiting:
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                      ),
                      Center(
                        child: Text(
                          "loading Data...",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  );
                default:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 100,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextField(
                          onChanged: (data) {
                            if (data.isEmpty) {
                              usdController.text = "";
                              euroController.text = "";
                            } else {
                              usdController.text =
                                  (double.parse(data) / finance.dollar)
                                      .toStringAsFixed(2);
                              euroController.text =
                                  (double.parse(data) / finance.eur)
                                      .toStringAsFixed(2);
                            }
                          },
                          controller: brController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: "R\$",
                              labelStyle: TextStyle(color: Colors.white)),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Divider(),
                        TextField(
                          onChanged: (data) {
                            if (data.isEmpty) {
                              brController.text = "";
                              euroController.text = "";
                            } else {
                              brController.text =
                                  (double.parse(data) * finance.dollar)
                                      .toStringAsFixed(2);
                              euroController.text = (double.parse(data) *
                                      finance.dollar /
                                      finance.eur)
                                  .toStringAsFixed(2);
                            }
                          },
                          controller: usdController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: "U\$D",
                              labelStyle: TextStyle(color: Colors.white)),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Divider(),
                        TextField(
                          onChanged: (data) {
                            if (data.isEmpty) {
                              brController.text = "";
                              usdController.text = "";
                            } else {
                              brController.text =
                                  (finance.eur * double.parse(data))
                                      .toStringAsFixed(2);
                              usdController.text = (double.parse(data) *
                                      finance.eur /
                                      finance.dollar)
                                  .toStringAsFixed(2);
                            }
                          },
                          controller: euroController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: "EUR",
                              labelStyle: TextStyle(color: Colors.white)),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'finance.store.g.dart';

class MobFinanceStore = FinanceStore with _$MobFinanceStore;

const request = "http://api.hgbrasil.com/finance?key=f0c83d46";

abstract class FinanceStore with Store {
  @observable
  var currencies;
  double dollar;
  double eur;
  double real;

  @action
  Future callCurrency() async {
    http.Response response = await http.get(request);
    Future.delayed(Duration(seconds: 2));
    currencies = json.decode(response.body)["results"]["currencies"];

    dollar = jsonDecode(response.body)['results']['currencies']['USD']['buy'];
    eur = jsonDecode(response.body)['results']['currencies']['EUR']['buy'];
  }
}

import 'package:mobx/mobx.dart';
part 'drawer.store.g.dart';

class MobDrawerStore = DrawerStore with _$MobDrawerStore;

abstract class DrawerStore with Store {
  @observable
  int page = 0;

  @action 
  void changePage(int page) {
    this.page = page;
  }
}

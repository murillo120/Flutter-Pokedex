import 'package:mobx/mobx.dart';
part 'todo.model.g.dart';

class TodoItem = _TodoItemBase with _$TodoItem;

abstract class _TodoItemBase with Store {

  _TodoItemBase({this.title, this.checked});

  @observable
  String title;

  @observable
  bool checked;

  @action
  void setCheck(bool checkValue){
    print("item checkado - $checkValue");
    checked = checkValue;
  }

  
}
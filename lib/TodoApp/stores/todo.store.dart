import 'package:mobx/mobx.dart';
import 'package:mobxlearn/TodoApp/models/todo.model.dart';
part 'todo.store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  @observable
  var list = ObservableList();

  @action
  void addTask(TodoItem task) {
    list.add(task);
  }

  @action
  void deleteTask(TodoItem element) {
    list.remove(element);
  }

  @action
  Future<bool> clearTasks() async {
    Future.delayed(Duration(seconds: 1), () {
      list.clear();
    });

    return false;
  }
}

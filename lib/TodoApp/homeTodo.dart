import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxlearn/TodoApp/customItem.dart';
import 'package:mobxlearn/TodoApp/models/todo.model.dart';
import 'package:mobxlearn/TodoApp/stores/todo.store.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  final controller = TodoStore();

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusColor: Colors.purple,
                  ),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              VerticalDivider(),
              MaterialButton(
                color: Colors.purple,
                child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (todoController.text.isNotEmpty) {
                    final todoItem = TodoItem();
                    todoItem.title = todoController.text;
                    todoItem.checked = false;
                    controller.addTask(todoItem);
                    todoController.text = "";
                  }
                },
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        Expanded(child: Observer(
          builder: (_) {
            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () {
                return controller.clearTasks();
              },
              child: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    var item = controller.list[index];
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment(-0.9, 0.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      key:
                          Key(DateTime.now().millisecondsSinceEpoch.toString()),
                      onDismissed: (direction) {
                        controller.deleteTask(item);
                      },
                      child: CustomItem(item: item),
                    );
                  }),
            );
          },
        ))
      ],
    ));
  }
}

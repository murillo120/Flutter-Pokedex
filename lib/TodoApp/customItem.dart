import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'models/todo.model.dart';

class CustomItem extends StatelessWidget {
  final TodoItem item;
  CustomItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          leading: Checkbox(value: item.checked, onChanged: item.setCheck),
          title: Text(item.title),
        );
      },
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStoreBase, Store {
  final _$listAtom = Atom(name: '_TodoStoreBase.list');

  @override
  ObservableList get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$clearTasksAsyncAction = AsyncAction('clearTasks');

  @override
  Future<bool> clearTasks() {
    return _$clearTasksAsyncAction.run(() => super.clearTasks());
  }

  final _$_TodoStoreBaseActionController =
      ActionController(name: '_TodoStoreBase');

  @override
  void addTask(TodoItem task) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction();
    try {
      return super.addTask(task);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(TodoItem element) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction();
    try {
      return super.deleteTask(element);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}

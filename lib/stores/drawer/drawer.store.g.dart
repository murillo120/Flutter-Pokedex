// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobDrawerStore on DrawerStore, Store {
  final _$pageAtom = Atom(name: 'DrawerStore.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$DrawerStoreActionController = ActionController(name: 'DrawerStore');

  @override
  void changePage(int page) {
    final _$actionInfo = _$DrawerStoreActionController.startAction();
    try {
      return super.changePage(page);
    } finally {
      _$DrawerStoreActionController.endAction(_$actionInfo);
    }
  }
}

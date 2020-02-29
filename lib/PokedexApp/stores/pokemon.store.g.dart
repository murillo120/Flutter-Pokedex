// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  final _$pageAtom = Atom(name: '_PokemonStoreBase.page');

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

  final _$listTosetAtom = Atom(name: '_PokemonStoreBase.listToset');

  @override
  ObservableList get listToset {
    _$listTosetAtom.context.enforceReadPolicy(_$listTosetAtom);
    _$listTosetAtom.reportObserved();
    return super.listToset;
  }

  @override
  set listToset(ObservableList value) {
    _$listTosetAtom.context.conditionallyRunInAction(() {
      super.listToset = value;
      _$listTosetAtom.reportChanged();
    }, _$listTosetAtom, name: '${_$listTosetAtom.name}_set');
  }

  final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase');

  @override
  void pokemonPage(int pageIndex) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction();
    try {
      return super.pokemonPage(pageIndex);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future refreshPage() {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction();
    try {
      return super.refreshPage();
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}

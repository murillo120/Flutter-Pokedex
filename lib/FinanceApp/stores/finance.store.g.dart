// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobFinanceStore on FinanceStore, Store {
  final _$currenciesAtom = Atom(name: 'FinanceStore.currencies');

  @override
  dynamic get currencies {
    _$currenciesAtom.context.enforceReadPolicy(_$currenciesAtom);
    _$currenciesAtom.reportObserved();
    return super.currencies;
  }

  @override
  set currencies(dynamic value) {
    _$currenciesAtom.context.conditionallyRunInAction(() {
      super.currencies = value;
      _$currenciesAtom.reportChanged();
    }, _$currenciesAtom, name: '${_$currenciesAtom.name}_set');
  }

  final _$callCurrencyAsyncAction = AsyncAction('callCurrency');

  @override
  Future<dynamic> callCurrency() {
    return _$callCurrencyAsyncAction.run(() => super.callCurrency());
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobXStore on _MobXStore, Store {
  late final _$transactionListAtom =
      Atom(name: '_MobXStore.transactionList', context: context);

  @override
  ObservableList<dynamic> get transactionList {
    _$transactionListAtom.reportRead();
    return super.transactionList;
  }

  @override
  set transactionList(ObservableList<dynamic> value) {
    _$transactionListAtom.reportWrite(value, super.transactionList, () {
      super.transactionList = value;
    });
  }

  late final _$_MobXStoreActionController =
      ActionController(name: '_MobXStore', context: context);

  @override
  void addNewTransaction(
      String incomeType,
      String cardType,
      String transactionType,
      String transactionTime,
      IconData transactionIcon,
      int amount) {
    final _$actionInfo = _$_MobXStoreActionController.startAction(
        name: '_MobXStore.addNewTransaction');
    try {
      return super.addNewTransaction(incomeType, cardType, transactionType,
          transactionTime, transactionIcon, amount);
    } finally {
      _$_MobXStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionList: ${transactionList}
    ''';
  }
}

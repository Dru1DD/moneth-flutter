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

  late final _$balanceAtom = Atom(name: '_MobXStore.balance', context: context);

  @override
  int get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(int value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$chartDataAtom =
      Atom(name: '_MobXStore.chartData', context: context);

  @override
  ObservableList<dynamic> get chartData {
    _$chartDataAtom.reportRead();
    return super.chartData;
  }

  @override
  set chartData(ObservableList<dynamic> value) {
    _$chartDataAtom.reportWrite(value, super.chartData, () {
      super.chartData = value;
    });
  }

  late final _$incomeListAtom =
      Atom(name: '_MobXStore.incomeList', context: context);

  @override
  ObservableList<dynamic> get incomeList {
    _$incomeListAtom.reportRead();
    return super.incomeList;
  }

  @override
  set incomeList(ObservableList<dynamic> value) {
    _$incomeListAtom.reportWrite(value, super.incomeList, () {
      super.incomeList = value;
    });
  }

  late final _$exspanseListAtom =
      Atom(name: '_MobXStore.exspanseList', context: context);

  @override
  ObservableList<dynamic> get exspanseList {
    _$exspanseListAtom.reportRead();
    return super.exspanseList;
  }

  @override
  set exspanseList(ObservableList<dynamic> value) {
    _$exspanseListAtom.reportWrite(value, super.exspanseList, () {
      super.exspanseList = value;
    });
  }

  late final _$_MobXStoreActionController =
      ActionController(name: '_MobXStore', context: context);

  @override
  void addNewTransaction(
      String catagory,
      String account,
      String transactionType,
      String transactionTime,
      IconData transactionIcon,
      int amount) {
    final _$actionInfo = _$_MobXStoreActionController.startAction(
        name: '_MobXStore.addNewTransaction');
    try {
      return super.addNewTransaction(catagory, account, transactionType,
          transactionTime, transactionIcon, amount);
    } finally {
      _$_MobXStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionList: ${transactionList},
balance: ${balance},
chartData: ${chartData},
incomeList: ${incomeList},
exspanseList: ${exspanseList}
    ''';
  }
}

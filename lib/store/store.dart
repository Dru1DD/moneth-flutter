import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MobXStore = _MobXStore with _$MobXStore;

abstract class _MobXStore with Store {
  @observable
  ObservableList transactionList = ObservableList();

  @action
  void addNewTransaction(
    String incomeType,
    String cardType,
    String transactionType,
    String transactionTime,
    IconData transactionIcon,
    int amount,
  ) {
    transactionList.add({
      'transactionType': transactionType,
      'transactionTime': transactionTime,
      'amount': amount,
      'cardType': cardType,
      'incomeType': incomeType,
      'transactionIcon': transactionIcon,
    });
  }
}

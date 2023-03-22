import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MobXStore = _MobXStore with _$MobXStore;

abstract class _MobXStore with Store {
  @observable
  ObservableList transactionList = ObservableList();

  @observable
  int balance = 0;

  @observable
  ObservableList chartData = ObservableList();

  @observable
  ObservableList incomeList = ObservableList();

  @observable
  ObservableList exspanseList = ObservableList();

  @action
  void addNewTransaction(
    String catagory,
    String account,
    String transactionType,
    String transactionTime,
    IconData transactionIcon,
    int amount,
  ) {
    final transaction = {
      'transactionType': transactionType,
      'transactionTime': transactionTime,
      'amount': amount,
      'cardType': account,
      'catagory': catagory,
      'transactionIcon': transactionIcon,
      'currency': "USD",
    };

    transactionList.add(transaction);

    if (transactionType == "+") {
      balance += amount;
      chartData.add(balance);
      incomeList.add(transaction);
    } else {
      balance -= amount;
      chartData.add(balance);
      exspanseList.add(transaction);
    }
  }
}

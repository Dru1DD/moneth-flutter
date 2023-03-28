// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'store.g.dart';

class MobXStore = _MobXStore with _$MobXStore;

abstract class _MobXStore with Store {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @observable
  bool isLoggedIn = false;

  @observable
  String userId = '';

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
  void setUserUid(String uid) {
    userId = uid;
  }

  @action
  void setLoggedIn(bool value) {
    isLoggedIn = value;
  }

  @action
  Future<void> fetchTransaction(uid) async {
    var querySnapshot = await _db.collection('transactions').get();
    transactionList.clear();
    for (var doc in querySnapshot.docs) {
      if (doc.id == uid) {
        final data = doc.data();

        // print(data);
        // print(data.runtimeType);
        // print(data['transactions']);
        // print(data['transactions'].runtimeType);

        transactionList.clear();
        incomeList.clear();
        exspanseList.clear();

        transactionList.addAll(data['transactions']);
        incomeList.addAll(data['incomeList']);
        exspanseList.addAll(data['exspanseList']);
      }
    }
  }

  @action
  Future<void> addNewTransaction(
    String catagory,
    String account,
    String transactionType,
    String transactionTime,
    String transactionIcon,
    int amount,
    user,
  ) async {
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

    DocumentReference transactionRef =
        _db.collection('transactions').doc(user.uid);

    DocumentSnapshot docSnapshot = await transactionRef.get();

    bool isDocExist = docSnapshot.exists;

    if (isDocExist) {
      await transactionRef.update({
        'balance': balance,
        'transactions': transactionList,
        'incomeList': incomeList,
        'exspanseList': exspanseList,
        'chartData': chartData,
      });
    } else {
      await transactionRef.set({
        'balance': balance,
        'transactions': transactionList,
        'incomeList': incomeList,
        'exspanseList': exspanseList,
        'chartData': chartData,
      });
    }
  }
}

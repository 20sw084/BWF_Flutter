import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../new_expense.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  User? user = FirebaseAuth.instance.currentUser;
  List<Expense> _registeredExpenses = [];

  @override
  void initState() {
    super.initState();
    if (user != null) {
      fetchExpenses();
    } else {
      // Handle the case when the user is not authenticated
      print("User is not authenticated");
    }
  }

  Future<void> fetchExpenses() async {
    if (user == null) {
      print("User is not authenticated");
      return;
    }

    List<Expense> expensesList = [];
    CollectionReference fireStore = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("expenses");

    try {
      QuerySnapshot expensesSnapshot = await fireStore.get();
      for (var doc in expensesSnapshot.docs) {
        expensesList.add(Expense.fromDocument(doc));
      }
    } catch (e) {
      print("Error fetching expenses: $e");
    }

    setState(() {
      _registeredExpenses = expensesList;
    });
  }

  Future<void> _addExpense(Expense expense) async {
    if (user == null) {
      print("User is not authenticated");
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("expenses")
          .add({
        'amount': expense.amount,
        'date': Timestamp.fromDate(expense.date),
        'title': expense.title,
        'type': expense.category.toString().split('.').last,
      });
      print("Expense added successfully");
      fetchExpenses();
    } catch (e) {
      print("Failed to add expense: $e");
    }
  }

  void _removeExpense(Expense expense) async {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("expenses")
          .doc(expense.documentId)
          .delete();
      print("Expense deleted successfully");
    } catch (e) {
      print("Failed to delete expense: $e");
    }
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expensify'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}

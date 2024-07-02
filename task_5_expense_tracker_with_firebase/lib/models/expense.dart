import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  final String documentId;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.documentId,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory Expense.fromDocument(DocumentSnapshot doc) {
    String categoryString = doc['type'];
    Category category;

    try {
      category = Category.values.firstWhere(
        (e) => e.toString() == 'Category.$categoryString',
      );
    } catch (e) {
      category = Category.work; // Default category
    }

    return Expense(
      documentId: doc.id,
      title: doc['title'],
      amount: (doc['amount'] as num).toDouble(),
      date: (doc['date'] as Timestamp).toDate(),
      category: category,
    );
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}

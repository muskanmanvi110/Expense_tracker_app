import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final foramtter = DateFormat.yMd();

const uuid = Uuid();

enum Category {food,travel,leisure,work}

const categoryIcons = {
  Category.food : Icons.dining_outlined,
  Category.travel : Icons.airplanemode_active_outlined,
  Category.leisure : Icons.movie,
  Category.work : Icons.work,
};

class Expense{

  Expense({required this.title, required this.date, 
  required this.expense, required this.category
  }) : id = uuid.v4();


  final String title;
  final DateTime date;
  final double expense;
  final Category category;
  final String id;

  String get getFormattedDate{
    return foramtter.format(date);
  }
}


class ExpenseBucket{
  const ExpenseBucket(
    {required this.category, 
    required this.expenses
    });

  ExpenseBucket.forcategory(List<Expense> allexpenses, this.category)
  : expenses = allexpenses
  .where((expense)=>expense.category == category)
  .toList();
  
  
  final Category category;
  final List<Expense> expenses;

  double get retrunsum{
    double sum = 0;
    for(int i=0 ; i<expenses.length ; i++){
      sum = sum + expenses[i].expense;
  }
  return sum;
  }
}
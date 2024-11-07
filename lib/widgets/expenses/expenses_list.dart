import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses/expenses_item.dart';
import 'package:flutter/material.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenselist,{super.key});

  final List<Expense> expenselist;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenselist.length,
      itemBuilder:(context,index) => ExpenseItem(expenselist[index]));
  }
}








import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenselist,this.removedexpense, {super.key});

  final void Function(Expense exp) removedexpense;

  final List<Expense> expenselist;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenselist.length,
        itemBuilder: (context, index) =>
            Dismissible(
            key: ValueKey(expenselist[index]), 
            onDismissed:(direction){
            removedexpense(expenselist[index]);
            } ,
            background: Container(color: Colors.red,),
            child: ExpenseItem(expenselist[index]),
      )
    );
  }
}

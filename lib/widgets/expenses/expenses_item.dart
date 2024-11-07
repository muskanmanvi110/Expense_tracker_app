import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
    child:
    Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      child: Column(
        children: [
          Text(expense.title),
          const SizedBox(height:10),
          Row(
            children: [
              Text("\$${expense.expense.toStringAsFixed(2)}"),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  Text(expense.getFormattedDate)
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}




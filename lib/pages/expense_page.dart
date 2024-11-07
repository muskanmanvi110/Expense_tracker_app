import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expenses/new_expenses.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {

  List<Expense> registeredexpensed = [];

  void addexpense(Expense exp){
    setState(() {
      registeredexpensed.add(exp);
    });
    
  }

  void _openbttomsheet(){
    showModalBottomSheet(
    isScrollControlled: true,
    context: context, 
    builder: (ctx) => NewExpenses(addexpense)
    );
  }
  
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter expense tracker"),
        actions: [
          IconButton(onPressed: _openbttomsheet, 
          icon: const Icon(Icons.add,))
        ],
      ),
      body:Column(
        children: [
          Expanded(child: ExpensesList(registeredexpensed))
        ],
      )
    );
  }
}








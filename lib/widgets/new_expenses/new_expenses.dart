import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

final foramtter = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses(this.onpressingsubmitbutton,{super.key});

  final void Function(Expense exp) onpressingsubmitbutton;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _titlecontroller = TextEditingController();
  final _expensecontroller = TextEditingController();
  DateTime? _selecteddate;
  Category _selectedcategory = Category.leisure;

  @override
  void dispose() {
    _titlecontroller.dispose();
    _expensecontroller.dispose();
    super.dispose();
  }

  void datepicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(2004,06,10);
    final date = await showDatePicker(context: context,
    initialDate: now, 
    firstDate: firstDate, 
    lastDate: now);

    setState(() {
      _selecteddate = date;
    });
  
  }

  void closemodal() {
    Navigator.pop(context);
  }

  void _saveexpense(){
    final _finalamount = double.tryParse(_expensecontroller.text);
    bool amountinvalid = false;
    if(_finalamount == null || _finalamount <=0){
      amountinvalid = true;
    }
    if(_titlecontroller.text.isEmpty || amountinvalid == true){
      showDialog(context: context, builder:(ctx){
        return AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please enter valid title or amount"),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(ctx);
            }, 
            child: const Text("Okay"))
          ],
        );
      } );
      return;
    }
    widget.onpressingsubmitbutton(Expense(
      title: _titlecontroller.text, 
      date: _selecteddate!, 
      expense: _finalamount!, 
      category: _selectedcategory));

      Navigator.pop(context);
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,80,16,16),
      child: Column(
        children: [
          TextField(
              controller: _titlecontroller,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text("Title"),
              )),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expensecontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: "\$ ", label: Text("Amount")),
                ),
              ),
              const SizedBox(width: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_selecteddate == null 
                  ? "no date selected" 
                  : foramtter.format(_selecteddate!)),
                  IconButton(
                      onPressed: datepicker, 
                      icon: const Icon(Icons.date_range))
                ],
              )
            ],
          ),
          const SizedBox(height:20),
          Row(
            children: [
              DropdownButton(
                value: _selectedcategory,
                items: Category.values.map((category){
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.name));
              }).toList(), 
              onChanged: (value){
                setState(() {
                  if(value == null){
                    return;
                  }
                  _selectedcategory = value;
                });
          
              }),
              const Spacer(),
              ElevatedButton(onPressed: closemodal, 
              child: const Text("Cancel")),
              const SizedBox(width:5),
              ElevatedButton(
                  onPressed: _saveexpense, 
                  child: const Text("Add Expense")
              ),
            ],
          )
        ],
      ),
    );
  }
}




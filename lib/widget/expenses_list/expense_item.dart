import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card( 
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        child:Column( 
          children: [ 
            Text(expense.title),
            const SizedBox(height: 4),
            Row(children: [ 

              Text("\$${expense.amount.toStringAsFixed(2)}"),

             const Spacer(),
          
              Row(children: [
                 const Icon(Icons.calendar_month),

                const SizedBox( width: 5),
                Text(expense.date.toString())

              ],)
            ],)
          ],
        ),
      ),
    );
  }
}

/*
ExpenseItem class er modde Card widget deya card banano hocce.
\$ sing k show kora no hocce.
toStringAsFixed(2) er madhome decimal number k . er por tar limit bole deya hocce 12.34
Specer() widget er madhome Text and Row widget er modde durutto barano hocce. Text()            Row()

ExpenseItem class conostructor er madhome expense models k pass kora hoice


 */
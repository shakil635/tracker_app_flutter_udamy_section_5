import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key});
  final Expense expense;
  /*
  Expense class er akta instance/object banano hoce.
  expense k call kore Expences er filed gula k dak deya jay.
  expences.amount
   */

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
                  Icon(catagoreyIcons[expense.category]),
               /*
               Map<Category, IconData> catagoreyIcons ,expense.category key and iconData value
               catagoreyIcons akta map.map theke key catagoreyIcons[e.c] 
               e.c k key hisabe babohar korsi.
                */
                const SizedBox( width: 5),
                Text(expense.formatedDate)

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
import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';
import 'package:tracker_app_section_5_udemy/widget/expenses_list/expense_item.dart';

class ExpensesLsit extends StatelessWidget {
  const ExpensesLsit({super.key,required this.expense});
final List<Expense> expense;
/*
expense banano hoice jar modde Expense type thakbe.
ExpensesLsit conostructor er modde bole deya hoice abashok

 */

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index)=>ExpenseItem(expense[index])
      /*
      onek boro r scrollable list bananor + maintain kora duitar jonno 
      ListView.builder widget babohar kora hoy.itemCount er modde  list er length
      itemBuilder er modde index unijai call kora hocce

       
       */
      
      );
  }
}
import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';
import 'package:tracker_app_section_5_udemy/widget/expenses_list/expense_item.dart';


class ExpensesLsit extends StatelessWidget {
  const ExpensesLsit({super.key,required this.expense,required this.onRemoveExpences});
final List<Expense> expense;

final void Function (Expense expense) onRemoveExpences;
/*
expense banano hoice jar modde Expense type thakbe.
ExpensesLsit conostructor er modde bole deya hoice abashok

 */

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index)=>Dismissible(
        key: ValueKey(expense[index]),
        onDismissed:(diraction){
          onRemoveExpences(expense[index]);
        } ,
        
        child:ExpenseItem(expense[index]))  


      /*
      onek boro r scrollable list bananor + maintain kora duitar jonno 
      ListView.builder widget babohar kora hoy.itemCount er modde  list er length
      itemBuilder er modde index unijai call kora hocce
      context hocce page r index hocce page number.


      *itemBuilder return kortese Dismissible jar madhome user left or ritht e expence gula
       remove korte parbe.
       Dismissible er key:ValueKey er modde expense list er length bole deya hoice.
       onDismissed: er modde driction deya bole deya hoce user expenes list er value remove kortese
      ExpenseItem toire kore expences list er data pathano hocce
       
       */
      
      );
  }
}
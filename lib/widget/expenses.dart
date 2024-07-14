import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/widget/expenses_list/expenses_list.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';
import 'package:tracker_app_section_5_udemy/widget/expenses_list/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  

  @override
  State<Expenses> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expenses> {

final List<Expense> _regestredExpenses =
[ 
  Expense(title: "Flutter course", amount: 15, date:DateTime.now(), category: Category.work),
    Expense(title: "Movie", amount: 15, date:DateTime.now(), category: Category.leisure),
];

/*
_regestredExpenses akta list banano hoice ai list er modde tahke Expense.
model theke Expense k call kora hoice
*/

void _openAdnexpencesOverlay(){
  
showModalBottomSheet(
  isScrollControlled: true,
  context: context,
   builder: (ctx)=>
    NewExpences(onAddExpence: _addExpenses));
}
/*
context:context deya bole deya hocce ai dailog ta kothay dekhate chai.
ctx deya ki dekhate chai ta banano hocce.
NewExpences k retun kora hoice.NewExpences k dekha te chai.
_openAdnexpencesOverlay icon button er onPressed method er modde babohar kora hoice.
isScrollControlled deya screen er full height neya hocce
NewExpences akta void functionney jeti user er add kora data _regestredExpenses list er modde store kore rakha hoy.

 */

void _addExpenses(Expense expense ){
  setState(() {
    _regestredExpenses.add(expense);
  });
}
/*
_regestredExpenses list er modde user er input deya expences amout,title,date add kora hocce.
new_expense theke ai input niya asa hocce.

 */

void removeExpences(Expense expense){
 setState(() {
    _regestredExpenses.remove(expense);
 });
}
/*
user left or right e jano expens gula remove korte par.
_regestredExpenses list thewke value remove kore hocce.

*/



  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar( 
        title: const Text("Flutter Tracker App"),
        actions: [ 
          IconButton(onPressed: _openAdnexpencesOverlay,
           icon:const Icon(Icons.add))
        ],
      ),
      body:  Column ( 
        children: [ 
        const  Text("chart..."),
          Expanded(child:
           ExpensesLsit(expense:
            _regestredExpenses,onRemoveExpences:
             removeExpences))
          
          /*
          ExpensesLsit class duita parameter nay.akta list r akta void function.
          tai _regestredExpenses ai list pass kora hoice r onRemoveExpences funtion deya list theke value remove kora hocce.       
           */
        ],
      ),
    );
  }
}

/*
ExpensesLsit k call kora hoice ja parameter hisabe _regestredExpenses k babohar kora hoice


 */
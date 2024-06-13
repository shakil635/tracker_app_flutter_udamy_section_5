import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/widget/expenses_list/expenses_list.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';

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

//_regestredExpenses akta list banano hoice ai list er modde tahke Expense.





  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body:  Column ( 
        children: [ 
        const  Text("chart..."),
          Expanded(child: ExpensesLsit(expense: _regestredExpenses))
          
        ],
      ),
    );
  }
}

/*
          ExpensesLsit k call kora hoice ja parameter hisabe _regestredExpenses k babohar kora hoice
            
           */
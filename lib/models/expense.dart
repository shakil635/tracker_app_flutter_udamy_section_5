
import 'package:uuid/uuid.dart';


const Uuid uuid= Uuid();
/*
Uuid akta random String ide generate widget jar madhome ramdom string ide generate kora jay.
Uuuid global variable kore rakha hoice.
 */
enum Category { food, travel, leisure, work }
/*
akta enum banano hoice Category jar modde 4ta item rakha hoice
 */


class Expense{
   Expense({required this.title, required this.amount, required this.date,required this.category})
  :id=uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

/*
Expense class akta models ba blue print ba fame.
data gula k ki vabe onno widget class e saja ba uposthapon kora jay tar akta model

 */
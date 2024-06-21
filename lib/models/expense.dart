
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormate = DateFormat.yMd();
/*
Dateformate class er madhome dateFormate er akta objecat banano hoice.
DateFormate k bivinno vabe sajano jay ai khan e yMd method deya Year/Month/day te sajano hoice


 */
const Uuid uuid= Uuid();
/*
Uuid akta random String ide generate widget jar madhome ramdom string ide generate kora jay.
Uuuid global variable kore rakha hoice.
 */
enum Category { food, travel, leisure, work }
/*
akta enum banano hoice Category jar modde 4ta item rakha hoice.
 */

const catagoreyIcons= {
  Category.food:Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.work:Icons.work,
  Category.leisure:Icons.movie
};
/*
akta map neya hoice  name catagoreyIcons,key gular sate icon value add kora hice.
food key jonno value icons lunch dining. 
*/


class Expense{
   Expense({required this.title, required this.amount, required this.date,required this.category})
  :id=uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;



String get formatedDate{
  return dateFormate.format(date);
}
/*
dateFormate er instanc er madhome format method k call kora hoice jar madhome date k pass kora hoice.
jar fole date formate onujai hocce.
 
 */

}



/*
Expense class akta models ba blue print ba fame.
data gula k ki vabe onno widget class e saja ba uposthapon kora jay tar akta model
jokhon new Expense object create kora hobe, tokhon notun ekta unique ID assign kora hobe uuid.v4() diye. 
 */

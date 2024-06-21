import 'package:flutter/material.dart';
import 'package:tracker_app_section_5_udemy/models/expense.dart';

class NewExpences extends StatefulWidget {
  const NewExpences({super.key, required this.onAddExpence});
  
  final void Function(Expense expense) onAddExpence;

  @override
  State<NewExpences> createState() => _NewExpencesState();
}

class _NewExpencesState extends State<NewExpences> {
// var _enterTitle = "";

// void _saveTitleInput(String inputValue){
//   _enterTitle =inputValue;
// }
/*
Textfield er modde user er text onChanged method er 
madhome _enterTitle variable er modde store kora hocce.
_saveTitleInput TextField er onChanged method e babohar kora hocce.

 */


final _titleEditControler = TextEditingController();
final _amountEditControler = TextEditingController();

DateTime? _selectDate;
Category _selectedCategory = Category.work;
//_selectedCategory k age thekei selecte kore rakha hopice.user jano dropdownItem er modde aita default vabe dekte pay.

void _presentDatePiker()async{
  final now = DateTime.now();
  final firstDate = DateTime(now.year-1,now.month,now.day);
  //final lastDate = DateTime(now.year+10,now.month,now.day);
  final pickedDate = await showDatePicker(context: context,initialDate: now, firstDate: firstDate, lastDate: now);
  setState(() {
    _selectDate =pickedDate;
  });
}
/*

user er input text k handel korar jonno TextEditingController(); babohar kora hoy
showDatePicker return kore future tai _presentDatePiker method k async kore deya 
hoice and await babohar kora hocce.pickedDate er modde showDatePiker k rakha hocce.
_selectDate akta variable banano hoice setState er modde pickedDate k selectDate er modde rakha hoce.
setSatebabohar korar karon _selectDate poriborton hobe jokhnon click kora hobe 
now.year-1 deya karon hocce akbosor back e theke yaer ta dekha be like: 2023 theke dekhabe
 */



void _submitExpencesData(){
final enteredAmount = double.tryParse(_amountEditControler.text);
final amountIsInvalid = enteredAmount==null || enteredAmount <=0;

if(_titleEditControler.text.trim().isEmpty|| amountIsInvalid ||_selectDate==null){
showDialog(context: context,
 builder: (ctx)=> AlertDialog( 
  title: const Text( "Invalid"),
  content:const Text("please make sure a valid title,amoun and Date was enter"),
  actions: [ 
    TextButton(onPressed: (){
      Navigator.pop(context);
    }, child: const Text("Closed"))
  ],
 ));
 return;
}
widget.onAddExpence(Expense(title: _titleEditControler.text,
 amount: enteredAmount, date: _selectDate!, category: _selectedCategory));
 Navigator.pop(context);

}

/*
_submitExpencesData use j expences banacce ta user k dekhano and jode user input vul hoy tahole error message 
dekhano hobe ai method er madhome.
enteredAmount er modde _amountEditControler ai strin k duble a convert kora hocce.
amountIsInvalid er modde condition deya check kora hoce user faka or negative kisu input jano na day.
showDailog return kortese AlartDailg.
AlartDailog er title,content and action property deya user k popup dekhacci.
action akta list jar modde button widget deya popup closed korar option deya hocce
widget. deya onno class er property er sate connect kortesi ,setur moto.
widget. deya onAddExpence er acces kortesi.
onAddExpence parameter hisabe ney Expence k  tai expences k call kora hoice.
user er input kora sokol data jano user dekte pay tai aigula data expenses class e pathano hocce.
_titleEditControler.text, deya ttle,enteredAmount deya amount,_selectDate daya date 
aivabe sob user er kase theke neya user k ai data dekhano hocce



 */



@override
  void dispose() {
    _titleEditControler.dispose();
    _amountEditControler.dispose();
    super.dispose();
  }
/*
proyojan er por jano controler dispos ba bondo kore day.otirikto memori jano na khay.
kaj ses e controlar k dispos kora hocce


 */


  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding:const EdgeInsets.fromLTRB(16,48,16,16) ,
    //fromLTRB deya top,bottom,left and right e pading deya jay
    child: Column( 
      children: [ 
        TextField(
          controller: _titleEditControler ,
          maxLength: 50,
          decoration:const InputDecoration( 
            label: Text("Title")
          ),
        ),

        Row( 
          children: [
             Expanded(
               child: TextField(
                         controller: _amountEditControler ,
                         keyboardType: TextInputType.number,
                         decoration:const InputDecoration( 
                          prefixText: "\$ ",
                           label: Text("Amount")
                         ),
                       ),
             ),
    const SizedBox(width: 16,),
    Expanded(
      child:Row( 
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
        Text(_selectDate == null ? "no selected Date" : dateFormate.format(_selectDate!)),
         IconButton(onPressed: _presentDatePiker,
          icon:const Icon(Icons.calendar_month))
         /*
        user er selecte date k show korano hocce._selectDate jodi null hoy tahole show korbe no selected Date text
        r null na hole user j date selecte korbe oita show korbe.
        iconButton er onpress er modde _presentDatePiker Method k call kora hocce.
         prefixText deya user er input deyar age kisu text or likha age thekei show korate chai user j text debe tar aage.
          */

        ],
      )
      
       ),


           ],
        ),

    

        Row(
          children: [ 
          DropdownButton(value: _selectedCategory,items: Category.values.map((catagory)
          => DropdownMenuItem(value: catagory,child: Text(catagory.name.toUpperCase()))).toList(),  
          onChanged: (value){
            if(value==null){
              return;
            }
          setState(() {
            _selectedCategory =value;
          });

          },),

          /*
          DropdownButton items er modde Category enum er value k rakha hoice.
          DropdownButton return koretese DropdownMenuitem.
          ai MenuItem er modde enum er value gula show korano hocce.
          onChanged er modde value jodi null hoy tahole kisu return korbe na.
          onno thay _selectedCategory er modde value, user j value selecte korbe oita rakha hobe.
          
           */

         const Spacer(),

            TextButton(onPressed: (){
              Navigator.pop(context);
            },
             /*
              context akta khatar moto.app er ui er button,text etc sob kisu ai khatar modde likha hoy.
              Navigator.pop() deya ai khata bondho kora hocce.
               */
             child: const Text("Cancle")),
            ElevatedButton(onPressed: _submitExpencesData,
             child: const Text("Save Expences"))
          ],
        )
      ],
    ),
    
    );
  }
}

/*
TextField jar madhome user text input korte pare.
maxLength deya bole deya hocce ai text field e koto length porjonto  text input kora jabe.
text field k sajanor jonno,


 */
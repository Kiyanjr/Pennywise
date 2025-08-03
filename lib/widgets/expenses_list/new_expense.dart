import 'package:expense1_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter=DateFormat.yMd();


class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpese});

  final void Function(Expense expense) onAddExpese;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleTextEditing = TextEditingController();
  final _titleAmountControl = TextEditingController();
  Category _userSelectedCategory=Category.entertaiment;
DateTime? _userSelectedDate;



void _showDatePicker()async{
  final now=DateTime.now();
  final first=DateTime(now.year-5,now.month-2,now.day-1);

final chosenDate =await showDatePicker(
  context: context,
  initialDate:now,
  firstDate: first, 
  lastDate: now,
);
setState(() {
  _userSelectedDate=chosenDate;
});
}

 void _submitingData()  {
  final amount=double.tryParse(_titleAmountControl.text);//tryparse=>string to number
  final invalidAmount=amount==null||amount<=0;

     if(_titleTextEditing.text.trim().isEmpty||_userSelectedDate==null||invalidAmount) {

       showDialog(context: context,
      builder:(ctx)=>AlertDialog(
      title: Text(" Invalid inputs!!"),
      content: Text("Please make sure you entered valid: amount, title, date and category"),
     actions: [
     TextButton(onPressed: (){
     Navigator.pop(ctx);
       },
      child: Text("Okay"),
      
      ),
        ],
          ),
          );
          return;
     }
widget.onAddExpese(Expense( 
title: _titleTextEditing.text, 
amount: amount, 
date:_userSelectedDate!, 
category: _userSelectedCategory)
);//<---accesing property of class
 Navigator.pop(context);
 }


  @override
  void dispose() {
    _titleTextEditing.dispose();
    _titleAmountControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,48,15,15),
      child: Column(
        children: [
          TextField(
            controller: _titleTextEditing, //<--Contorling user input
            maxLength: 60,
            decoration: InputDecoration(label: Text('Title: ')),
          ),
          //DATE AND AMOUT
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleAmountControl,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount: '),
                  ),
                ),
              ),
              const SizedBox(width: 16),
             Expanded(child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Calender UI
                Text(_userSelectedDate==null?' No date is selected ':formatter.format(_userSelectedDate!),),//! wont be null
                IconButton(onPressed: _showDatePicker,
                 icon: const Icon(
                Icons.calendar_month_rounded)
                ),
              ],
             ),),
            ],
          ),
          const SizedBox(height:10),
          //-----------------Buttons------------
          Row(
            children: [
              DropdownButton(
                value: _userSelectedCategory,
                items:Category.values.map(
                (category)=>DropdownMenuItem(
                value:category,
                child:Text(//<--------visibale to the user
                  category.name.toUpperCase(),//name is String no need for Tostring()
                  ),
                ),
                )
                .toList(),
              onChanged: (value){
              setState(() {
                if(value==null){
                  return;
                }
                _userSelectedCategory=value;
              });
               },
               ),
               Spacer(),
              ElevatedButton(
                onPressed: _submitingData,
                child: Text('SUBMIT'),
              ),
              const SizedBox(width:2),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('CANCLE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
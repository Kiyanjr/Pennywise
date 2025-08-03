import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid=const Uuid();
 
 final formatter=DateFormat.yMEd();

enum Category{food , travel, work,housing,transportation,entertaiment }

const categoryIcons={ //<---maping
 Category.food:Icons.fastfood,
 Category.travel:Icons.airplane_ticket,
 Category.work:Icons.work,
  Category.housing:Icons.home,
   Category.transportation:Icons.car_rental,
    Category.entertaiment:Icons.movie,
};

class Expense {
   Expense({required this.title, 
   required this.amount,
   required this.date,
   required this.category
   })
    : id=uuid.v4() ;// initializ list we created unique ID property
final String id;  
final String title;
final double amount;
final DateTime date;
final Category category;

String get formattedDate{
    return formatter.format(date);
}
}

class ExpenseChart{
  const ExpenseChart({  required this.category,required this.expenses});

ExpenseChart.forCategory(List<Expense>allExpenses,this.category) 
 :expenses=allExpenses.where((expense)=>expense.category==category).toList();//second "category" is the one in alternative


  final Category category;
   final List<Expense> expenses;


double get totalExpenses{//<--storing expenses
  double sum=0;
for(final expense in expenses){
  sum+=expense.amount;
}
  return sum;
}

}
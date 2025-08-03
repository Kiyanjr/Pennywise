import 'package:expense1_tracker/models/expense.dart';

import 'package:expense1_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
const ExpensesList(
  {
  super.key,
  required this.expenses,
  required this.onremoveExpense,
}
);

final List<Expense> expenses;
final void Function(Expense expense) onremoveExpense;

@override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length,
    itemBuilder:(ctx,index)=>Dismissible(
    background: Container(color:Theme.of(context).colorScheme.errorContainer,
    margin: EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal),//<---marging is from the card here litterally without it its from the card background wallpaper
    ),
    key:ValueKey(expenses[index]),
    onDismissed:(direction){
      onremoveExpense(expenses[index]);
    },
    child:ExpenseItem(expenses[index] )),
    );
  }

}
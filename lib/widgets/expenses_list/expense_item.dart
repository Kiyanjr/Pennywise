import 'package:expense1_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
const ExpenseItem(this.expense,{super.key});


final Expense expense;

  @override
  Widget build(BuildContext context) {
   return Card(
    child:Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          expense.title,
          style: Theme.of(context).textTheme.titleLarge),//first row
          const SizedBox(height: 3),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(4)}'),

           const Spacer(),
           
              Row(
                 children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 6,),
                  Text(expense.date.toString()),
                 ],
              ),
              
            ],
          )

        ],
      ),
    ),
    );
  }
}
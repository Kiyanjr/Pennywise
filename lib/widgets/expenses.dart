import 'package:expense1_tracker/main.dart';
import 'package:expense1_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense1_tracker/widgets/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense1_tracker/models/expense.dart';
import 'package:expense1_tracker/widgets/chart/chart.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Trip to  Japan',
      amount: 2784.65,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'کافه گردی',
      amount: 45.3,
      date: DateTime.now(),
      category: Category.entertaiment,
    ),
  ];

  void _openUserAddingExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpese: _updateExpense),
    );
  }

  void _updateExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removingExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense); //<<--Removing internally
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text('Expense deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainPage = const Center(child: Text("Enter Expenses."));
    if (_registeredExpenses.isNotEmpty) {
      mainPage = ExpensesList(
        expenses: _registeredExpenses,
        onremoveExpense: _removingExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('PennyWise💵'),
        actions: [
          IconButton(
            onPressed: _openUserAddingExpense,
            icon: Icon(Icons.account_box),
          ), //<---icons goign to new expense page
        ],
      ),
      body:
       Column(
        children: [
          Chart(expenses:_registeredExpenses),
        Expanded(
          child: mainPage
        )
        ]
      ),
    );
  }
}

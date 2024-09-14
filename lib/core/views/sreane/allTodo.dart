import 'package:flutter/material.dart';
import 'package:todos/core/views/compons/cardTodo.dart';
import 'package:todos/core/viewsmodels/todoVM.dart';

class allTodo extends StatefulWidget {
  const allTodo({super.key});

  @override
  State<allTodo> createState() => _allTodoState();
}

class _allTodoState extends State<allTodo> {
  @override
  Widget build(BuildContext context) {
    Todovm tvm = Todovm();

    return Cardtodo(t: tvm, reqType: 'all');
  }
}

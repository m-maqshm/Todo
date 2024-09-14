import 'package:flutter/material.dart';

import '../../viewsmodels/todoVM.dart';
import '../compons/cardTodo.dart';
import 'limitdTodo.dart';

class homeScreane extends StatefulWidget {
  const homeScreane({super.key});

  @override
  State<homeScreane> createState() => _homeScreaneState();
}

class _homeScreaneState extends State<homeScreane> {
  @override
  Widget build(BuildContext context) {
    Todovm tvm = Todovm();

    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(title: Text("data"),
        backgroundColor: Colors.lightBlue,
        bottom:TabBar(
        tabs:  [
        Text("all todo ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
        Text("True complet ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
        Text("False complet  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
      ],),),
      body: TabBarView(children: [

         Cardtodo(t: tvm, reqType: 'all'),
         Cardtodo(t: tvm, reqType: 'true'),
         Cardtodo(t: tvm, reqType: 'false'),

      ]),
      ) );
  }
}

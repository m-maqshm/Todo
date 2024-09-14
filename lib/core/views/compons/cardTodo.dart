import 'package:flutter/material.dart';
import 'package:todos/core/viewsmodels/todoVM.dart';

class Cardtodo extends StatelessWidget {
  Todovm t;
  String reqType;
   Cardtodo({super.key ,required this.t , required this.reqType });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: t.getTodo(typeRq: reqType),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Card(child: ListTile(
              title:Text(' ${snapshot.data![index].todo}') ,
              subtitle:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('completed: ${snapshot.data![index].completed}'),
                  Text('USER ID ${snapshot.data![index].userId}'),
                ],
              ) ,
              leading: CircleAvatar(child: Center(child: Text('${snapshot.data![index].id}',style: TextStyle(fontSize: 11),),),),
            ),);
          },);}else{return Center(child: Text('Loade',style: TextStyle(fontSize: 30),),);}
      }

    );
  }
}

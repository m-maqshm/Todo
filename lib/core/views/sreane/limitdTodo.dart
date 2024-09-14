import 'package:flutter/material.dart';
import 'package:todos/core/views/compons/cardTodo.dart';
import 'package:todos/core/viewsmodels/todoVM.dart';

class LimitedTodo extends StatefulWidget {
  const LimitedTodo({super.key});

  @override
  State<LimitedTodo> createState() => _LimitedTodoState();
}

class _LimitedTodoState extends State<LimitedTodo> {
  TextEditingController limcon =TextEditingController();
  TextEditingController skpcon =TextEditingController();
  Todovm tvm = Todovm();
  int? limit,skip;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
      
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17),
                height: 180,child: Column(children: [
                  TextFormField(
                decoration:InputDecoration(label: Text('entrr tha limit'),
                disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 4)
                ,borderRadius: BorderRadius.circular(20),))
                    ,
                    controller: limcon,
              ),SizedBox(height: 5,),
      TextFormField(
        decoration:InputDecoration(label: Text('entrr tha limit'),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 4)
              ,borderRadius: BorderRadius.circular(20),))
        ,
        controller: skpcon,
      ),ElevatedButton(onPressed: () {
        limit = int.parse(limcon.text);
        skip =  int.parse(skpcon.text);
        setState(() {

        });

      }, child: Text('dune'))

        ],),),
              Container(
                color: Colors.grey,
                height: 500,
                child: limit!=null&&skip!=null?FutureBuilder(
                    future: tvm.getlimtedTodo(limit: limit!, skip: skip!),
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

                ): Center(child: Text("data"),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

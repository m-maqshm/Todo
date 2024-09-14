import 'package:dio/dio.dart';
import 'package:todos/core/models/todo.dart';
import 'package:todos/core/views/sreane/allTodo.dart';

class Todovm {
  Future<List<Todos>?> getTodo({required String typeRq}) async {

    Dio d = Dio();
    try {
      Response res = await d.get('https://dummyjson.com/todos');
      switch(typeRq){
        case 'all':{List<Todos> allTodo = (res.data['todos'] as List).map((todoJson) => Todos.fromJson(todoJson)).toList();
        return allTodo;}
        case 'true':{
          List<Todos> comTrueaTodo = (res.data['todos'] as List).map((todoJson) => Todos.fromJson(todoJson)).where((element) => element.completed == true,).toList();
          return comTrueaTodo;}
        case 'false':{
          List<Todos> comTrueaTodo = (res.data['todos'] as List).map((todoJson) => Todos.fromJson(todoJson)).where((element) => element.completed == false,).toList();
          return comTrueaTodo;}

      }

    } catch (e) {
      print('errrro $e');
    }
  }

  Future<List<Todos>?> geTruetTodo() async {
    Dio d = Dio();
    try {
      Response res = await d.get('https://dummyjson.com/todos');
      List<Todos> allTodo = (res.data['todos'] as List)
          .map((todoJson) => Todos.fromJson(todoJson))
          .where(
            (element) => element.completed == true,
          )
          .toList();
      return allTodo;
    } catch (e) {
      print('errrro $e');
    }
  }
}

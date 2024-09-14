import 'package:dio/dio.dart';
import 'package:todos/core/models/todo.dart';
import 'package:todos/core/views/sreane/limitdTodo.dart';

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

  Future<List<Todos>?> getlimtedTodo({required int limit, required int skip}) async {
    Dio d = Dio();
    try {
      Response res = await d.get('https://dummyjson.com/todos?limit=$limit&skip=$skip');
      List<Todos> lemtd = (res.data['todos'] as List).map((todoJson) => Todos.fromJson(todoJson)).toList();
      return lemtd;
    } catch (e) {
      print('errrro $e');
    }
  }
}

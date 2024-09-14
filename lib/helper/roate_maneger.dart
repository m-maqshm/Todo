import 'package:flutter/material.dart';

import '../core/views/sreane/home.dart';
import '../core/views/sreane/limitdTodo.dart';
import '../core/views/sreane/notfaound.dart';


class RoutManger{
  static Route<dynamic>? approute(RouteSettings route){
    switch(route.name) {
      case '/home': return MaterialPageRoute(builder: (context) => homeScreane(),);
      case '/limit': return MaterialPageRoute(builder: (context) => LimitedTodo(),);
      // default: return MaterialPageRoute(builder: (context) => NotFoundPage(),);
    }
  }
}
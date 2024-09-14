import 'package:flutter/material.dart';

import '../core/views/sreane/home.dart';
import '../core/views/sreane/notfaound.dart';


class RoutManger{
  static Route<dynamic>? approute(RouteSettings route){
    switch(route.name) {
      case '/home': return MaterialPageRoute(builder: (context) => homeScreane(),);
      // default: return MaterialPageRoute(builder: (context) => NotFoundPage(),);
    }
  }
}
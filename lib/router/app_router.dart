import 'package:flutter/material.dart';
import 'package:state_management/catBloc/bloc_cats_view.dart';
import 'package:state_management/cubit/counter/counter_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CounterView());
        break;
      case '/cat':
        return MaterialPageRoute(builder: (_) => BlocCatsView());
        break;
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:state_management/catBloc/bloc_cats_view.dart';
import 'package:state_management/catMobx/cat_view.dart';
import 'package:state_management/constants/navigation_constant.dart';
import 'package:state_management/counter_mobx/counter_mobx_view.dart';
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
      case NavigationConstant.CAT_VIEW:
        return MaterialPageRoute(builder: (_) => CatView());
        break;
      case NavigationConstant.COUNTER_MOBX_VIEW:
        return MaterialPageRoute(builder: (_) => CounterMobxView());
        break;
      default:
        return null;
    }
  }
}

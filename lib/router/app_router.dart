import 'package:flutter/material.dart';
import 'package:state_management/constants/navigation_constant.dart';
import 'package:state_management/screens/bloc_cats_view.dart';
import 'package:state_management/screens/counter_view.dart';
import 'package:state_management/mobx/catMobx/cat_view.dart';
import 'package:state_management/mobx/counter_mobx/counter_mobx_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationConstant.COUNTER_CUBIT_VIEW:
        return MaterialPageRoute(builder: (_) => CounterView());
        break;
      case NavigationConstant.BLOC_CAT_VIEW:
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/catBloc/bloc_cats_view.dart';
import 'package:state_management/counter_mobx/counter_mobx_view.dart';
import 'package:state_management/cubit/counter/counter_view.dart';
import 'package:state_management/cubit/counter/cubit/counter_cubit.dart';
import 'package:state_management/catMobx/cat_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(title: 'Material App', home: CounterMobxView()),
    );
  }
}

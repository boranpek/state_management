import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/catBloc/cats_cubit.dart';
import 'package:state_management/cubit/counter/cubit/counter_cubit.dart';
import 'package:state_management/router/app_router.dart';
import 'repository/cats_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<CatsCubit>(create: (context) => CatsCubit(SampleCatsRepository())),
      ],
      child: MaterialApp(
        title: 'Material App',
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}

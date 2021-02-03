import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/counter/cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              child: BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.isIncremented) {
                    final snackBar = SnackBar(content: Text('Incremented!'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  return Text(state.counter.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
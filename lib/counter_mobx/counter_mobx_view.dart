import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/counter_mobx/counter_mobx_view_model.dart';

class CounterMobxView extends StatelessWidget {
  final _viewModel = CounterMobxViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (context) {
        return FloatingActionButton(onPressed: () {
          _viewModel.increment();
          if (_viewModel.isIncremented) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Incremented!')));
          }
        });
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(onTap: () {
              _viewModel.decrement();
            }, child: Observer(builder: (_) {
              return Text(_viewModel.counter.toString());
            })),
          ],
        ),
      ),
    );
  }
}

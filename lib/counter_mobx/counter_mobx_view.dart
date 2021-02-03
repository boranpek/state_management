import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/counter_mobx/counter_mobx_view_model.dart';
import 'package:state_management/cubit/counter/counter_view.dart';

class CounterMobxView extends StatelessWidget {
  final String title;
  final _viewModel = CounterMobxViewModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CounterMobxView({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            Text("This is Mobx " + title),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cat");
              },
              child: Text("Go to other screen"),
            ),
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

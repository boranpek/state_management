import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/catBloc/bloc_cats_view.dart';
import 'package:state_management/catMobx/cat_view_model.dart';
import 'package:state_management/constants/navigation_constant.dart';
import 'package:state_management/counter_mobx/counter_mobx_view_model.dart';

class CatView extends StatelessWidget {
  final _viewModel = CatViewModel();
  final _viewCounterModel = CounterMobxViewModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () async {
          await _viewModel.getCats();
          if (_viewModel.pageState == PageState.ERROR) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
          }
        },
      ),
      body: buildScaffoldBody(context),
    );
  }

  Center buildScaffoldBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("This is CatMobx"),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, NavigationConstant.BLOC_CAT_VIEW);
            },
            child: Text("Go to other screen"),
          ),
          TextButton(
            onPressed: () {
              _viewCounterModel.increment();
            },
            child: Observer(builder: (_) {
              return Text(_viewCounterModel.counter.toString());
            }),
          ),
          Observer(builder: (_) {
            switch (_viewModel.pageState) {
              case PageState.LOADING:
                return CircularProgressIndicator();
              case PageState.COMPLETED:
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Image.network(_viewModel.catList[index].imageUrl),
                        subtitle: Text(_viewModel.catList[index].description),
                      );
                    },
                    itemCount: _viewModel.catList.length,
                  ),
                );
              case PageState.ERROR:
                return Text("Error");
              default:
                return SizedBox();
            }
          }),
        ],
      ),
    );
  }
}

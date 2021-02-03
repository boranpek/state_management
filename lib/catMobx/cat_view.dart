import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/catBloc/bloc_cats_view.dart';
import 'package:state_management/catMobx/cat_view_model.dart';
import 'package:state_management/constants/navigation_constant.dart';

class CatView extends StatelessWidget {
  final _viewModel = CatViewModel();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is Mobx"),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, NavigationConstant.COUNTER_MOBX_VIEW);
              },
              child: Text("Go to other screen"),
            ),
            buildScaffoldBody(),
          ],
        ),
      ),
    );
  }

  Center buildScaffoldBody() {
    return Center(
      child: Column(
        children: [
          Observer(builder: (_) {
            switch (_viewModel.pageState) {
              case PageState.LOADING:
                return CircularProgressIndicator();
              case PageState.COMPLETED:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Image.network(_viewModel.catList[index].imageUrl),
                      subtitle: Text(_viewModel.catList[index].description),
                    );
                  },
                  itemCount: _viewModel.catList.length,
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

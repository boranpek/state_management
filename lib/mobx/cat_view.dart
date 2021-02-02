import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/mobx/cat_view_model.dart';

class CatView extends StatelessWidget {
  final _viewModel = CatViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (context) {
        return FloatingActionButton(
          child: Icon(Icons.get_app),
          onPressed: () async {
            await _viewModel.getCats();
            if (_viewModel.pageState == PageState.ERROR) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
            }
          },
        );
      }),
      body: buildScaffoldBody(),
    );
  }

  Center buildScaffoldBody() {
    return Center(
      child: Observer(builder: (_) {
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
    );
  }
}

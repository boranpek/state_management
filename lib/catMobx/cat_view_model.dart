import 'dart:convert';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/catMobx/cat.dart';
part 'cat_view_model.g.dart';

class CatViewModel = _CatViewModelBase with _$CatViewModel;

abstract class _CatViewModelBase with Store {
  @observable
  List<Cat> catList = [];

  final url = "https://hwasampleapi.firebaseio.com/http.json1";

  @observable
  PageState pageState = PageState.NORMAL;

  @action
  Future<void> getCats() async {
    pageState = PageState.LOADING;
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.body) as List;
      catList = jsonBody.map((e) => Cat.fromJson(e)).toList();
      pageState = PageState.COMPLETED;
    } else {
      pageState = PageState.ERROR;
    }
  }
}

enum PageState { NORMAL, LOADING, COMPLETED, ERROR }

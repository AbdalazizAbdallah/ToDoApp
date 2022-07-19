
import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';

import '../helper/api/my_http_request.dart';
import '../helper/api/request_to_do.dart';

class RequestHttpToDoProvider with ChangeNotifier{

  MyHTTPRequest<List<ToDoEntity>>? _requestHttpToDo;
  List<ToDoEntity>? _list;
  int _idSelected = -1;

  RequestHttpToDoProvider(){
    _requestHttpToDo = RequestHttpToDo();
    listOfEntity();
  }

  void listOfEntity() async {
    _list = await _requestHttpToDo!.execute();
    notifyListeners();
  }

  set setIdSelected(int newIdSelected){
    _idSelected = newIdSelected;
  }

  ToDoEntity? get toDoSelected {
    if(_list!.isNotEmpty && _idSelected!=-1) {
      return _list!.singleWhere((element) => element.id == _idSelected);
    }
    return null;
  }

  List<ToDoEntity>? getDoneTask(){
    return _list!.where((element) => element.isFavorite).toList();
  }
  List<ToDoEntity>? getLaterTask(){
    return _list!.where((element) => element.isFavorite==false).toList();
  }


  List<ToDoEntity>? get list => _list;

}
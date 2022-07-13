


import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';

import 'helper/api/request_to_do.dart';

class RequestHttpToDoProvider with ChangeNotifier{

  RequestHttpToDo? _requestHttpToDo;
  late List<ToDoEntity>? _list;

  RequestHttpToDoProvider(){
    _requestHttpToDo = RequestHttpToDo();
    listOfEntity();
  }

  void listOfEntity() async {
    _list = await _requestHttpToDo!.execute();
    notifyListeners();
  }

  List<ToDoEntity>? get list => _list;

}
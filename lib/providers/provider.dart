


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';

import '../helper/api/http_request.dart';
import '../helper/api/request_to_do.dart';

class RequestHttpToDoProvider with ChangeNotifier{

  MyHTTPRequest<List<ToDoEntity>>? _requestHttpToDo;
  List<ToDoEntity>? _list;

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
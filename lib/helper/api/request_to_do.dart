import 'dart:convert';
import 'package:to_do_app/helper/api/api_service.dart';
import 'package:to_do_app/helper/api/my_http_request.dart';
import 'package:to_do_app/model/to_do.dart';
import 'package:http/http.dart' as http;

class RequestHttpToDo implements MyHTTPRequest<List<ToDoEntity>> {

  @override
  Future<List<ToDoEntity>> execute() async {
    // TODO: implement execute

    Uri parseUrl = Uri.parse('${ApiService.baseUrl}${ApiService.toDoPath}');
    http.Response response = await http.get(parseUrl);

    if (response.statusCode != 200) {
      throw http.ClientException('status code ${response.statusCode}');
    }

    return _parseResponse(response.body);
  }

  List<ToDoEntity> _parseResponse(String response) {

    return (jsonDecode(response) as List).map((element) => ToDoEntity.fromJson(element)).toList();

  }
}

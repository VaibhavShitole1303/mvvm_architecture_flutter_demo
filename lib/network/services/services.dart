import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../presentation/home/model/todo_model.dart';
import 'network_helper.dart';


class ServiceClass {
  static Future<Object> getTodoData() async {
    try {
      var url = Uri.parse("https://dummyjson.com/todos");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          List<TodoModel> todoList =
          decodedResponse.map((item) => TodoModel.fromJson(item)).toList();
          return Success(code: 200, response: todoList);
        } else if (decodedResponse is Map<String, dynamic>) {
          TodoModel todoModel = TodoModel.fromJson(decodedResponse);
          return Success(code: 200, response: [todoModel]);
        } else {
          return Failure(
              code: response.statusCode,
              response: "Invalid Response Structure");
        }
      } else {
        return Failure(
            code: response.statusCode, response: "Invalid Response Coming");
      }
    } catch (e) {
      return "Invalid Response";
    }
  }
}
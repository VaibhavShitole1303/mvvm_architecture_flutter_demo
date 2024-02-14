

import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture_flutter_demo/network/services/network_helper.dart';
import 'package:mvvm_architecture_flutter_demo/network/services/services.dart';

import '../model/todo_model.dart';
// this is mvvm row
// class TodoViewModel extends{
//   List<TodoModel> _todoModel=[];
//   List<TodoModel> get todoModel=> _todoModel;
//
//   setTodoModel(List<TodoModel> todoModel){
//     _todoModel = todoModel;
//   }
//   getTodoMResponse() async{
//     var finalResponse = await ServiceClass.getTodoData();
//     if(finalResponse is Success){
//       setTodoModel(finalResponse.response as List<TodoModel>);
//     }
//     if(finalResponse is Failure){
//       print(finalResponse.code);
//     }
//   }
// }

// with providers
class TodoViewModel extends  ChangeNotifier{ // to use provider extend our class by ChangeNotifier
  List<TodoModel> _todoModel=[];
  List<TodoModel> get todoModel=> _todoModel;

  setTodoModel(List<TodoModel> todoModel){
    _todoModel = todoModel;
    notifyListeners();// with the help of this provider notify the app that _todoModel value changes if it changes then
  }
  getTodoMResponse() async{
    var finalResponse = await ServiceClass.getTodoData();
    if(finalResponse is Success){
      setTodoModel(finalResponse.response as List<TodoModel>);
    }
    if(finalResponse is Failure){
      print(finalResponse.code);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter_demo/presentation/home/view_model/to_do_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TodoViewModel todoViewModel=Provider.of<TodoViewModel>(context); // here we creating viewmodel object with the help of provider
    //by this we link viewModel with view

    return Scaffold(
      appBar:AppBar(
        title: Text("TO Do List"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
          todoViewModel.getTodoMResponse();
          }, child: Text(
            "get todo response",style: TextStyle(color: Colors.black)
            ,)),
          
          Expanded(
            child: ListView.builder(
              itemCount:  todoViewModel.todoModel.length,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  children: [
                    SizedBox(height: 30,),
                    for (var todoItem in todoViewModel.todoModel[index].todos ?? [])
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(

                          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("TODO : ${todoItem.todo}",style: TextStyle(color: Colors.orange,fontSize: 20),),
                            ],
                          ),
                        ),
                      )

                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

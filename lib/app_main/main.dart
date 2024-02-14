import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter_demo/presentation/home/view_model/to_do_view_model.dart';
import 'package:provider/provider.dart';

import '../presentation/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>TodoViewModel())  // tis is for provider
      ],
      child: MaterialApp(
        title: 'MVVM in flutter demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


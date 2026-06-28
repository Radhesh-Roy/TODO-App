import 'package:flutter/material.dart';
import 'package:todo/ui/home_view.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My ToDo",
      initialRoute: "/home",
      routes: {
        "/home":(context)=>HomeViewPage()
      },
    );
  }
}


import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6EAF4),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("TODO Task", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today's Focus", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          SizedBox(height: 5,),
          Text("You have 5 tasks pending today", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
              return ListTile(
                title: Text("call my friend business perpose"),
                leading: Checkbox(
                  activeColor: Colors.blue,
                  value: true, onChanged: (value) => null,),

              );
            },),
          )



        ],
      ),

      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {

  final key=GlobalKey<FormState>();
  TextEditingController task= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6EAF4),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.transparent,
        tooltip: "Add Task",
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        onPressed: (){
          showDialog(context: context, builder: (context) {
            return Dialog(
              backgroundColor: Colors.white,
              child: Padding(padding: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Form(
                    key: key,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Add Task", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: task,
                          validator: (value){
                            if(value==null|| value.isEmpty){
                              return "Enter Tasks";
                            }
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Task",
                            suffixIcon: Icon(Icons.mic, size: 25,)

                          ),

                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            if(key.currentState!.validate()){
                              log("correct");

                            }
                            log("Incorrect");
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            child: Center(child: Text("Create Task", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),),),
                          ),
                        )
                      ],),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        hoverColor: Colors.transparent,
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel_outlined, size: 30,)))
                ],
              )
              ),
            );
          },);

        }, child: Center(child: Text("+", style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.w500),),),),
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
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.10),
                      blurRadius: 4,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0)
                    ),
                  ]
                ),
                child:InkWell(
                  onLongPress: (){
                    showDialog(context: context, builder: (context) {
                      return  Dialog(
                        backgroundColor: Colors.white,
                        child: Padding(padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("What do you want?", style: TextStyle(fontSize: 20),),
                                SizedBox(height: 15,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child:Text("Edit", style: TextStyle(fontSize: 15, color: Colors.green),),),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child:Text("Delete", style: TextStyle(fontSize: 15, color: Colors.red),),),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                hoverColor: Colors.transparent,
                                child: Icon(Icons.cancel_outlined, size: 30,)))
                          ],
                        )

                        ),
                      );
                    },);
                  },
                  child: ListTile(
                    title: Text("call my friend business purpose"),
                    leading: Checkbox(
                      activeColor: Colors.blue,
                      value: true, onChanged: (value) => null,),
                  ),
                ),
              );
            },),
          )
        ],
      ),

      ),
    );
  }
}

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
              return Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child:InkWell(

                  onLongPress: (){

                    showDialog(context: context, builder: (context) {
                      return  Dialog(
                        backgroundColor: Colors.white,
                        child: Padding(padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("What dou you want?", style: TextStyle(fontSize: 20),),
                            SizedBox(height: 15,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 140,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 40,
                                  width: 140,
                                  color: Colors.red,
                                ),
                              ],
                            )
                          ],
                        ),),
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

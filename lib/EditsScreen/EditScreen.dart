import 'package:flutter/material.dart';

import '../models/taskmodel.dart';

class EditScreen extends StatelessWidget {
  static const String routeName="edit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(25),
        child: Card(
          elevation: 5,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.white
            )
          ),

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                ),
                SizedBox(
                  height: 80,
                ),
                Text("Select Time",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:28
                ),),
                SizedBox(
                  height: 40,
                ),
                Text("Date"),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(onPressed: (){}, child: Text("Save changes "))



              ],
            ),
          ),
        ),
      ),
    );
  }
}

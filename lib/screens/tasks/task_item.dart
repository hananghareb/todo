import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_2/EditsScreen/EditScreen.dart';
import 'package:todo_2/models/taskmodel.dart';
import 'package:todo_2/shared/network/firebase/firebase_functions.dart';
import 'package:todo_2/shared/styles/colors/app_colors.dart';

class TaskItem extends StatelessWidget {
  Taskmodel taskmodel;
  TaskItem({required this.taskmodel ,super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (Context){
            FirebaseFunction.deleteTask(taskmodel.id);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
        SlidableAction(
          onPressed: (Context){
            Navigator.pushNamed(context, EditScreen.routeName);

          },
          backgroundColor: PrimaryColor,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ]),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                height: 80,
                color: PrimaryColor,
                width: 4,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskmodel.title,style: GoogleFonts.quicksand(
                    fontSize: 18
                  )),
                  Text(taskmodel.decription,style: GoogleFonts.quicksand(
                    fontSize: 14,
                  )),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                decoration: BoxDecoration(
                  color:taskmodel.isdone??false? Colors.green: PrimaryColor,
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Icon(Icons.done,color:Colors.white,size: 30,)),

            ],
          ),
        ),
      ),
    );
  }
}

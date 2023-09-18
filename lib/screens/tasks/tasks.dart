import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_2/screens/tasks/task_item.dart';
import 'package:todo_2/shared/network/firebase/firebase_functions.dart';
import 'package:todo_2/shared/styles/colors/app_colors.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days:365)),
          lastDate: DateTime.now().add(Duration(days:365)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor: PrimaryColor,
          dayColor: PrimaryColor.withOpacity(.6),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: PrimaryColor,
          dotsColor: PrimaryColor,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),

        StreamBuilder(stream:FirebaseFunction.getTasks(selectedDate),builder: (context, snapshot) {
    if(snapshot.connectionState==ConnectionState.waiting){
    return Center(child: (CircularProgressIndicator()));
    }
    if(snapshot.hasError){
    return Text("someting went wrong");
    }
    var tasks=snapshot.data?.docs.map((e) =>e.data()).toList()??[];

    if(tasks.isEmpty){
      return Center(child: Text("No Tasks"));
    }
    return Expanded(
    child: ListView.builder(itemBuilder: (context, index) {
    return TaskItem(taskmodel: tasks[index],);
    },
    itemCount:tasks.length,

    ),
    );
    },)
      ],
    );

  }
}

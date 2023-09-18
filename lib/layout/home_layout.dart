import 'package:flutter/material.dart';
import 'package:todo_2/screens/seeting.dart';
import 'package:todo_2/screens/tasks/add_task_bottomsheet.dart';
import 'package:todo_2/screens/tasks/tasks.dart';
import 'package:todo_2/shared/styles/colors/app_colors.dart';
import 'package:todo_2/shared/styles/theming/mytheme.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName="home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget>tabs=[TasksTab(),SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("toDo"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(
            color: Colors.white,
            width: 3
          )
        ),
        onPressed: (){
          showaddtaskbottomsheet();
        
      },
        child: Icon(Icons.add,size: 30,),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex=value;
            setState(() {

            });
          },
           items: [
             BottomNavigationBarItem(icon: Icon(Icons.list),label: ""),

             BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),


           ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }
  void showaddtaskbottomsheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(18),
        topLeft: Radius.circular(18)),
      ),
        context: context, builder: (context) =>Padding(
        padding:EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: Addtaslbottomsheet()));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_2/models/taskmodel.dart';
import 'package:todo_2/shared/network/firebase/firebase_functions.dart';
import 'package:todo_2/shared/styles/colors/app_colors.dart';

class Addtaslbottomsheet extends StatefulWidget {
  @override
  State<Addtaslbottomsheet> createState() => _AddtaslbottomsheetState();
}

class _AddtaslbottomsheetState extends State<Addtaslbottomsheet> {
var formkey =GlobalKey<FormState>();
var selecteddate=DateTime.now();
var titleController=TextEditingController();
var descriptionController=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key:formkey ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
                child: Text("add new Task",style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),)),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if(value.toString().length <4){
                  return "please enter title at least 4 char";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text("task title",
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: PrimaryColor
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              maxLines: 4,
              controller: descriptionController,
              decoration: InputDecoration(
                  label: Text("task description"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: PrimaryColor
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
                child: Text("Select date",style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: PrimaryColor,
                  fontWeight: FontWeight.bold
                ),)),
            Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    ChooseDataTime();
                  },
                  child: Container(
                    alignment: Alignment.center,
                      child: Text(selecteddate.toString().substring(0,10),style: GoogleFonts.aBeeZee(
                        fontSize: 16,

                      ),)),
                )),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
                onPressed: (){
                  if(formkey.currentState!.validate()) {
                    Taskmodel task = Taskmodel(title: titleController.text,
                        decription: descriptionController.text
                        ,
                        date: DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch);
                    FirebaseFunction.addtask(task);
                    Navigator.pop(context);
                  }

            }, child:Text("ADD Task") )

          ],
        ),
      ),
    );
  }

  void ChooseDataTime() async{
   DateTime? chooseDate=await showDatePicker(context: context,

        initialDate: selecteddate, firstDate: DateTime.now()
        , lastDate: DateTime.now().add(Duration(days : 365)));
   if(chooseDate !=null){
     selecteddate=chooseDate;
     setState(() {
     });


   }

  }
}

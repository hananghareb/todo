import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_2/models/taskmodel.dart';

class FirebaseFunction{
   static CollectionReference<Taskmodel> getTaskCollection(){
   return FirebaseFirestore.instance.collection("Tasks")
        .withConverter<Taskmodel>(fromFirestore: (snapshot, _) {
      return Taskmodel.FromJson(snapshot.data()!);

  },


        toFirestore: (value, _) {
          return value.toJason();
        },);
  }
  static Future<void> addtask(Taskmodel task){
    var Collection=getTaskCollection();
    var docRef= Collection.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }
  static Stream<QuerySnapshot<Taskmodel>> getTasks(DateTime date){
     print(date.millisecondsSinceEpoch);
     return getTaskCollection().where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch).
     snapshots();
  }

  static Future<void> deleteTask(String id){
    return getTaskCollection().doc(id).delete();

  }

  static Future <void> updatetask(String id,Taskmodel task){
     return getTaskCollection().doc(id).update(task.toJason());
  }
  }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_2/EditsScreen/EditScreen.dart';
import 'package:todo_2/layout/home_layout.dart';
import 'package:todo_2/shared/styles/theming/mytheme.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
        EditScreen.routeName:(context) => EditScreen(),
      },
      theme: Mythemedata.LightTheme,
      darkTheme: Mythemedata.DarkTheme,

    );
  }
}

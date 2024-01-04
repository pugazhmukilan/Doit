import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "Home.dart";
late SharedPreferences prefs ;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
 /* Task t1 = Task(name: "nonimp", information: "nonimp", important: false);
  Task t2 = Task(name: "nonimp2", information: "nonimp2", important: false);
  Task t3 = Task(name: "imp", information: "important", important: true);
  Task t4 = Task(name: "imp4", information: "important", important: true);
  addObjectToList("important", t1);  
  addObjectToList("important", t2); 
  addObjectToList("nonimportant", t3); 
  addObjectToList("nonimportant", t4); */
  await fetchData();
  runApp( MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Home(),
      ),
    );
  }
}

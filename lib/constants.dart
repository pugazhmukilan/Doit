import "package:flutter/material.dart";

import "task.dart";

TextStyle Kbigfonts = TextStyle(fontFamily: "MajorMonoDisplay",fontWeight: FontWeight.w400,fontSize: 50,color:Kgreycolor);
TextStyle Ksmallgreenfonts = TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 10,fontWeight:FontWeight.w300,color:Kgreencolor);
TextStyle Kgreenumber = TextStyle(fontSize: 60,fontWeight:FontWeight.w500,color:Kgreencolor);
Color Kgreycolor = Color.fromARGB(255, 160, 160, 160);
Color Kgreycolor_dark = Color.fromARGB(255, 85, 85, 85);
Color Kgreencolor =Color.fromARGB(255, 26, 255, 186);
List <String> cat = ["AlL","IMPOrTAnT","!IMPOrTAnT","DoNe"];
List <Task> all = [];
List <Task> important = [];
List <Task> nonimportant = [];
List <Task> done = [];
int? totaltask = 0 ;

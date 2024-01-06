import "package:Doit/constants.dart";
import "package:flutter/material.dart";
class Congrats extends StatefulWidget {
  int task = 0;
  Congrats({super.key,required this.task});

  @override
  State<Congrats> createState() => _CongratsState(task:task);
}

class _CongratsState extends State<Congrats> {
  int task ;
  _CongratsState({required this.task});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image_taskno.png'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
      ),
      child: Center(child: Text("${task}",style: TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 120,color: Kgreencolor,fontWeight: FontWeight.w900),)),
    ));
  }
}
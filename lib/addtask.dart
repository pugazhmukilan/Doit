import 'package:avatar_glow/avatar_glow.dart';
import "package:doit/constants.dart";
import "package:doit/task.dart";
import "package:flutter/material.dart";

import "main.dart";

bool imp = false;
late BuildContext _context;
TextEditingController tasknamecontroller = TextEditingController();
TextEditingController taskinfocontroller = TextEditingController();
class Addtask extends StatefulWidget {
  int number = 0;
  
  Addtask({super.key,required this.number});
  

  @override
  State<Addtask> createState() => _AddtaskState(number :number);
}

class _AddtaskState extends State<Addtask> {
  int number = 0;
  _AddtaskState({required this.number});
  
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body:Container(
         width:double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgroundimage.png'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:10,bottom:5,right:15,left:15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Image.asset("assets/backarrow.png")),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text("CREATE",style:Kbigfonts),
                       Text("TASK",style:Kbigfonts),
                      ],
                    ),
                    
                    Text("${number+1}",style: Kgreenumber,)
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
              onTap: () {setState(() {
                imp=!imp;
              });},
              child: Container(
                height:40,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: imp ? Colors.black : const Color.fromARGB(255, 72, 72, 72),
                    width: 1, // Border width
                  ),
                  color: imp ? Color.fromARGB(255, 26, 255, 186) : Color.fromARGB(255, 43, 43, 43),
                ),
                child: Center(
                  child: Text(
                    "Important",
                    style: TextStyle(
                      fontSize:15,
                      fontFamily: "MajorMonoDisplay",
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      color: imp? Colors.black:Color.fromARGB(255, 136, 136, 136),
                      
                
                    ),
                  ),
                ),
              ),
            ),
                  ],
                ),
          
          
                TextField(
                  style: TextStyle(color: Kgreencolor), 
                  cursorColor: Kgreencolor,
                  maxLines: 1,
                controller: tasknamecontroller,
                decoration: InputDecoration(
                  
                  focusColor: Kgreencolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 2.0, // Adjust the width for the focused border
                  color: Kgreencolor, // Change the color for the focused border
                ),
              ),
                  hintText: "TiTLe...",
                  
                  hintStyle: TextStyle(
                    fontFamily: "MajorMonoDisplay",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Kgreencolor.withOpacity(0.7), // Set opacity to 80%
                    letterSpacing: 0.0, // Increase letter spacing for thicker appearance
                  ),
                ),
              ),
          
              SizedBox(
                height:10
              ),
              TextField(
                style: TextStyle(color: Kgreencolor), 
                cursorColor: Kgreencolor,
                maxLines: 10,
                controller: taskinfocontroller,
                decoration: InputDecoration(
                  
                  focusColor: Kgreencolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 2.0, // Adjust the width for the focused border
                  color: Kgreencolor, // Change the color for the focused border
                ),
              ),
                  hintText: "Info...",
                  hintStyle: TextStyle(
                    fontFamily: "MajorMonoDisplay",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Kgreencolor.withOpacity(0.7), // Set opacity to 80%
                    letterSpacing: 0.0, // Increase letter spacing for thicker appearance
                  ),
                ),
              ),
          
              SizedBox(
                height:20
              ),

              Center(
                child: AvatarGlow(
                          glowRadiusFactor: 1.8,
                          animate: true,
                          glowColor: Color.fromARGB(255, 26, 255, 186),
                          repeat: true,
                          glowCount: 2,
                          child: GestureDetector(
                                onTap: () async {
                  await _handleAddTask(number);
                  setState(() {
                    // Update the state synchronously after the asynchronous work is done
                  });
                },
                
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 26, 255, 186),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text(
                      "ADd TASK",
                      style: TextStyle(
                        fontFamily: "MajorMonoDisplay",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                          ),
                        ),
              )

              
              
              ],
                  
                  
            ),
          ),
        ),
      ),
      )
    );
  }
}


// Add this method outside the build method
Future<void> _handleAddTask(int number) async {
  Task mytask = Task(
    name: tasknamecontroller.text,
    information: taskinfocontroller.text,
    important: imp,
  );
  tasknamecontroller.clear();
  taskinfocontroller.clear();
  imp=false;

  if (mytask.important) {
    
    addObjectToList("important", mytask);
    
    prefs.setInt("TotalTask", number+1);
    print("added the number ===================================================${number+1}");
   
    Navigator.pop(_context, true);
  } else {
    addObjectToList("nonimportant", mytask);
    prefs.setInt("TotalTask", number+1);
    print("added the number ==================================================${number+1}");
    Navigator.pop(_context, true);
  }

}
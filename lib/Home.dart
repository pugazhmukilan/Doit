import "package:Doit/addtask.dart";
import "package:Doit/constants.dart";
import 'package:avatar_glow/avatar_glow.dart';
import "package:flutter/material.dart";

import "congrats.dart";
import "task.dart";
 List<Map<String, dynamic>> shownlist=allTasks;
String pressed = "all";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isfinished = false;

  
  
  @override
  void initState(){
    super.initState();
    print("shown list============================${shownlist}");
     
    
    
    

  }
  //here there should be the function which retrives the  json file
  //and segriate 

 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: AvatarGlow(
        glowRadiusFactor: 0.5,
        animate: true,
        glowColor: Kgreencolor,
        repeat: true,
        glowCount: 1,
        child: GestureDetector(
          onTapDown: (details)  {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Addtask(number:totaltask!.toInt())))
            .then((result) {
          if (result != null && result is bool && result) {
            // Task was added, update the UI
            fetchData();
            
           
          }
        });
          },
          
          
          child: CircleAvatar(
            backgroundColor: Kgreencolor,
            radius: 30,
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ),
        
      
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
              padding: const EdgeInsets.only(top:5,bottom:5,right:15,left:15),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:5),
                    child: Text("TrIUMp",style:Kbigfonts),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:0),
                    child: Row(
                      children: [
                        Text("IT",style:Kbigfonts),
                        SizedBox(width:20),
                        Image.asset("assets/Home_page_arrow.png"),
                        
                        
                        
                        //SECOND MAIN ROW
                        
                      ],
                    ),
                  ),
                        
                        
                        
                        
                        
                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Text("Complete your tasks and get better every day to achieve it ",style: TextStyle(fontWeight: FontWeight.w400,fontSize:13,color:Colors.grey),textAlign: TextAlign.start,)),
                           Expanded(child: Column(
                             children: [
                               Center(child: GestureDetector(
                                onLongPress: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Congrats(task:totaltask!.toInt()))));
                                },
                                child: Text("${totaltask}",style: Kgreenumber,))),
                              Text("TASK COMPLETED",style: Ksmallgreenfonts,)
                             ],
                           ))
                          
                          ],
                        ),
                           SizedBox(
                height: 10,
                           ),
                        
                  ButtonRow(
                listname: cat,
                height: 50,
                whenselected: Color.fromARGB(255, 26, 255, 186),
                whennotselected: const Color.fromARGB(255, 43, 43, 43),
                textselected: Colors.black,
                textnotselected: Color.fromARGB(255, 136, 136, 136),
                onButtonPressed: (buttonName) {
                        setState(() {
                          if (buttonName == "AlL") {
                            shownlist = allTasks;
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print(shownlist);
                            
                          } else if (buttonName == "IMPOrTAnT") {
                            
                            shownlist = importantTasks;
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print(shownlist);
                            
                          } else if (buttonName == "!IMPOrTAnT") {
                            

                            shownlist = nonImportantTasks;
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print(shownlist);
                          } else if (buttonName == "DoNe") {
                            

                            shownlist = doneTasks;
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print(shownlist);
                          }
                        });}
                
                          ),
                        
                          SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                        
                  children: [
                    for(int i=0;i<shownlist.length;i++)
                    
                    GestureDetector(
                      onLongPress: (){
                       
                        updateTaskStatusByName(shownlist[i]["name"], true);

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Container(
                          height:60,
                          width:double.infinity,
                          decoration: BoxDecoration(color:Color.fromARGB(255, 44, 44, 44),
                          borderRadius: BorderRadius.circular(20)),
                          
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(
                    
                                  child:Icon(Icons.done,color: Kgreencolor.withOpacity(0.7),)
                                )),
                              Expanded(
                                flex:4,
                                child: Container(child: Text(shownlist[i]['name'],style:TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 15,fontWeight: FontWeight.w800,color:Kgreencolor)))),
                              
                              if (shownlist[i]['important']==true)
                              Expanded(
                                
                                child: Container(
                                 
                                  child: Icon(Icons.star,color: Colors.yellow,),
                              
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                        
                  ],
                  
                ),
                        
                          ),
                  
                ],
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}
class ButtonRow extends StatefulWidget {
  final List<String> listname;
  final double height;
  final Color whenselected;
  final Color whennotselected;
  final Color textselected;
  final Color textnotselected;
  final Function(String) onButtonPressed;

  ButtonRow({
    required this.listname,
    required this.height,
    required this.whenselected,
    required this.whennotselected,
    required this.textselected,
    required this.textnotselected,
    required this.onButtonPressed,
  });

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  String selectedButton = "AlL";
  bool isSelected = true; 
  //String buttonName = "AlL";// Default selected button

  void _handleButtonPress(String buttonName) {
    setState(() {
      selectedButton = buttonName;
      print(selectedButton);
      print(buttonName);
    });
    widget.onButtonPressed(buttonName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.listname.map((buttonName) {
          isSelected = buttonName == selectedButton;
          return GestureDetector(
            onTap: () => _handleButtonPress(buttonName),
            child: Container(
              height: widget.height,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? Colors.black : const Color.fromARGB(255, 72, 72, 72),
                  width: 1,
                ),
                color: isSelected ? widget.whenselected : widget.whennotselected,
              ),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "MajorMonoDisplay",
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: isSelected ? widget.textselected : widget.textnotselected,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}




  Future<void> fetchData() async {
   allTasks = await  getTasksWithStatusFalse();
   importantTasks = await getImportantTasks();
   nonImportantTasks = await getNonImportantTasks();
   doneTasks = await getDoneTasks();

  // Print or use the data as needed
  print('All Tasks: $allTasks');
  print('Important Tasks: $importantTasks');
  print('Non-Important Tasks: $nonImportantTasks');
  print('Done Tasks: $doneTasks');

  
}
import "package:Doit/addtask.dart";
import "package:Doit/constants.dart";
import 'package:avatar_glow/avatar_glow.dart';
import "package:flutter/material.dart";

import "congrats.dart";
import "main.dart";
 List<Map<String, dynamic>> shownlist=[];

String selectedButton= 'AlL';
late int total = 0 ;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  
  
  @override
  void initState(){
    super.initState();
    fetchdata();
   
     }
  //here there should be the function which retrives the  json file
  //and segriate 
  Future<void> fetchdata()async{
    print("init state methos id going on=======================");
    await getdata("AlL");
    total = await prefs.getInt("total")!.toInt();
    setState(() {
      
    });
  }

 
  
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
            
            Navigator.push(context, MaterialPageRoute(builder: (context) => Addtask(number:total)))
            .then((result) async{
          
            // Task was added, update the UI
            print("bacck operation for update=====================================");
            total = await prefs.getInt("total")!.toInt();
            if (selectedButton == "AlL") {
                            shownlist = await db.getallUndoneTasks();
                            
                            
                          } else if (selectedButton == "IMPOrTAnT") {
                            
                            shownlist = await db.getImportantTasks();
                            
                            
                          } else if (selectedButton == "!IMPOrTAnT") {
                            

                            shownlist = await db.getNonImportantTasks();
                            
                          } else if (selectedButton == "DoNe") {
                            

                            shownlist = await db.getDoneTasks();
                            
                          }
                
                        setState(() {
                          print(selectedButton);
                          
                        });
            setState(() {
              
            });
            
           
          }
        );
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
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Congrats(task:total))));
                                },
                                child: Text("${total}",style: Kgreenumber,))),
                              Text("TASK COMPLETED",style: Ksmallgreenfonts,)
                             ],
                           ))
                          
                          ],
                        ),
                           SizedBox(
                height: 10,
                           ),
                        
                  ButtonRow(
                def:selectedButton,
                listname: cat,
                height: 50,
                whenselected: Color.fromARGB(255, 26, 255, 186),
                whennotselected: const Color.fromARGB(255, 43, 43, 43),
                textselected: Colors.black,
                textnotselected: Color.fromARGB(255, 136, 136, 136),
                onButtonPressed: (buttonName) async{
                       if (buttonName == "AlL") {
                            shownlist = await db.getallUndoneTasks();
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print(shownlist);
                            
                          } else if (buttonName == "IMPOrTAnT") {
                            
                            shownlist = await db.getImportantTasks();
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print(shownlist);
                            
                          } else if (buttonName == "!IMPOrTAnT") {
                            

                            shownlist = await db.getNonImportantTasks();
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print(shownlist);
                          } else if (buttonName == "DoNe") {
                            

                            shownlist = await db.getDoneTasks();
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print(shownlist);
                          }
                        setState(() {
                          
                        });
                        
                        
                        }
                        
                
                          ),
                      //tasklist(mainlist: shownlist),
                      SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                        
                  children: [
                    for(int i=0;i<shownlist.length;i++)
                    
                    GestureDetector(
                        onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text(shownlist[i]['name'],style: TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 20,fontWeight:FontWeight.w800,color: Kgreencolor),),
                            content: Text(shownlist[i]['information']==""? "No information avaiable":shownlist[i]['information'],style: TextStyle(fontFamily: "inter",fontSize: 15,fontWeight:FontWeight.w400,color:Colors.grey),),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK',style: TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 18,fontWeight:FontWeight.w500,color:Color.fromARGB(255, 248, 200, 24)),),
                              ),
                              TextButton(
                                onPressed: () async{
                                  await db.deleteTaskByName(shownlist[i]['name']);
                                  Navigator.of(context).pop();
                                  await getdata(selectedButton);
                                  setState(() {
                                    
                                  });
                                },
                                child: Text('Delete',style: TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 18,fontWeight:FontWeight.w500,color:Color.fromARGB(255, 248, 200, 24)),),
                              ),
                            ],
                          ),
                        );
                      },






      onHorizontalDragEnd: (details) {
        
      },
                      onDoubleTap: ()async{
                       
                        await db.updatemakeitdone(shownlist[i]['name']);
                        print("printing  in the dsouble tapp");
                        print(selectedButton);
                        await getdata(selectedButton);
                        setState(() {
                          print("done the updation ================================");
                        });


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
                              
                              if (shownlist[i]['important']==1)
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




class tasklist extends StatefulWidget {
  List<Map<String, dynamic>> mainlist;
  tasklist({super.key,required this.mainlist});

  @override
  State<tasklist> createState() => _tasklistState(mainlist:mainlist);
}

class _tasklistState extends State<tasklist> {

  List<Map<String, dynamic>> mainlist;
  _tasklistState({required this.mainlist});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                        
                  children: [
                    for(int i=0;i<mainlist.length;i++)
                    
                    GestureDetector(
                      onLongPress: (){
                       
                        

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
                                child: Container(child: Text(mainlist[i]['name'],style:TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 15,fontWeight: FontWeight.w800,color:Kgreencolor)))),
                              
                              if (mainlist[i]['important']==true)
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
                        
                          );
  }
}
class ButtonRow extends StatefulWidget {
  final List<String> listname;
  final String def ;
  final double height;
  final Color whenselected;
  final Color whennotselected;
  final Color textselected;
  final Color textnotselected;
  final Function(String) onButtonPressed;

  ButtonRow({
    required this.def,
    required this.listname,
    required this.height,
    required this.whenselected,
    required this.whennotselected,
    required this.textselected,
    required this.textnotselected,
    required this.onButtonPressed,
  });

  @override
  _ButtonRowState createState() => _ButtonRowState(def:def);
}

class _ButtonRowState extends State<ButtonRow> {
  String def;
  _ButtonRowState({required this.def});
  
  bool isSelected = true; 
  @override
  void initState(){
    super.initState();
    selectedButton = "AlL";
    selectedButton = def;
  }
  //String buttonName = "AlL";// Default selected button

  void _handleButtonPress(String buttonName) {
    setState(() {
      selectedButton = buttonName;
      print(selectedButton);
      print(buttonName);
    });
    widget.onButtonPressed(buttonName);
    //getdata(buttonName);
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



Future<void> getdata(String buttonName)async{
if (buttonName == "AlL") {
                            shownlist = await db.getallUndoneTasks();
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print(shownlist);
                            
                          } else if (buttonName == "IMPOrTAnT") {
                            
                            shownlist = await db.getImportantTasks();
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print(shownlist);
                            
                          } else if (buttonName == "!IMPOrTAnT") {
                            

                            shownlist = await db.getNonImportantTasks();
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print(shownlist);
                          } else if (buttonName == "DoNe") {
                            

                            shownlist = await db.getDoneTasks();
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print(shownlist);
                          }
                          

  
                        }

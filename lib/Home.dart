import "package:Doit/addtask.dart";
import "package:Doit/constants.dart";
import 'package:avatar_glow/avatar_glow.dart';
import "package:flutter/material.dart";

import "congrats.dart";
import "main.dart";
 List<Map<String, dynamic>> shownlist=[];

String selectedButton= 'AlL';
late int total = 0 ;
late int complete = 0;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  

  
  
  @override
  void initState(){
    super.initState();
    fetchdata();
   
     }
  //here there should be the function which retrives the  json file
  //and segriate 
  Future<void> fetchdata()async{
    //print("init state methos id going on=======================");
    await getdata("AlL");
    total = await prefs.getInt("total")!.toInt();
    complete = await prefs.getInt("complete")!.toInt();
    setState(() {
      
    });
  }

 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:Scaffold(
        key: _scaffoldKey,
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
            //print("bacck operation for update=====================================");
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
                          //print(selectedButton);
                          
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
        
      drawer: Drawer(
        width:200,
        
        backgroundColor: Color.fromARGB(133, 53, 53, 53),
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(191, 17, 17, 17),
                /*borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                bottomRight: Radius.circular(20))*/
              ),
              child: Text(
                'DOIT OpTiOns',
                style:TextStyle(fontFamily: "MajorMonoDisplay",fontWeight: FontWeight.w500,color:Kgreycolor,fontSize: 25)
              ),
            ),
            ListTile(
              leading: Icon(Icons.reset_tv_rounded,color: Color.fromARGB(255, 250, 210, 30),),
              title: Text('Reset',style:TextStyle(fontFamily: "MajorMonoDisplay",color:Kgreencolor,fontSize: 15)),
              onTap: () {
                // Handle drawer item tap
                showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text("Alert",style: TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 20,fontWeight:FontWeight.w800,color: Kgreencolor),),
                            content: Text("Do You really want to reset?",style: TextStyle(fontFamily: "inter",fontSize: 15,fontWeight:FontWeight.w400,color:Colors.grey),),
                            actions: [
                              TextButton(
                                onPressed: ()async {
                                  await db.ResetAll();
                                  total = await prefs.getInt("total")!.toInt();
                                  complete = await prefs.getInt("complete")!.toInt();
                                  await getdata(selectedButton);
                                  
                                  setState(() {
                                    
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK',style: TextStyle(fontFamily: "MajorMonoDisplay",fontSize: 18,fontWeight:FontWeight.w500,color:Color.fromARGB(255, 248, 200, 24)),),
                              ),
                              
                            ],
                          ),
                        );   
                // Close the drawer
                // Add your logic for Home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.undo_outlined,color: Color.fromARGB(255, 250, 210, 30),),
              title: Text('Delete Done Task',style: TextStyle(fontFamily: "MajorMonoDisplay",color:Kgreencolor,fontSize: 15),),
              onTap: ()async {
                // Handle drawer item tap
                await  db.deleteAllDoneTask();
                await getdata(selectedButton);
                
                setState(() {
                  
                });
                 // Close the drawer
                // Add your logic for Settings screen
              },
            ),
            // Add more ListTile items as needed
          ],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TrIUMp",style:Kbigfonts),
                        IconButton(onPressed: (){
                          _scaffoldKey.currentState?.openDrawer();
                        }, icon: Image.asset("assets/sidebar.png")),
                      ],
                    ),
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
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Congrats(task:complete))));
                                },
                                child: Text("${complete}",style: Kgreenumber,))),
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
                            /*print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print(shownlist);*/
                            
                          } else if (buttonName == "IMPOrTAnT") {
                            
                            shownlist = await db.getImportantTasks();
                           /* print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print(shownlist);*/
                            
                          } else if (buttonName == "!IMPOrTAnT") {
                            

                            shownlist = await db.getNonImportantTasks();
                            /*print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print(shownlist);*/
                          } else if (buttonName == "DoNe") {
                            

                            shownlist = await db.getDoneTasks();
                            /*print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print(shownlist);*/
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
                                  if (shownlist[i]['status']==0){
                                  total--;}
                                  else{

                                  }
                                  prefs.setInt("total",total);
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

                        if (shownlist[i]['status']==0){
                          complete++;
                        prefs.setInt("complete",complete);
                        /*print("=================================");
                        print("=================================");
                        print("=================================");
                        print("=================================");
                        print(await prefs.getInt("complete"));*/
                        await db.updatemakeitdone(shownlist[i]['name']);
                        //print("printing  in the dsouble tapp");
                       // print(selectedButton);
                        await getdata(selectedButton);}
                        
                        
                        else{
                          complete--;
                          prefs.setInt("complete",complete);
                        /*print("=================================");
                        print("=================================");
                        print("=================================");
                        print("=================================");
                        print(await prefs.getInt("complete"));*/
                        await db.updatemakeitundone(shownlist[i]['name']);
                        //print("printing  in the dsouble tapp");
                        
                        //print(selectedButton);
                        await getdata(selectedButton);

                        }


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


                    shownlist.isEmpty? Center(
                      child: Text(
                        "GREAT\n you have done every task",style: TextStyle(fontFamily: "MajorMonoDisplay",fontWeight: FontWeight.w500, color:const Color.fromARGB(104, 158, 158, 158)),textAlign:TextAlign.center,
                      ),
                    ) :Text("") , 
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
      //print(selectedButton);
      //print(buttonName);
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
                            /*print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print("showing the data of ======================ALL TASK ==============================");
                            print(shownlist);*/
                            
                          } else if (buttonName == "IMPOrTAnT") {
                            
                            shownlist = await db.getImportantTasks();
                            /*print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print("showing the data of ======================IMPORTANT==============================");
                            print(shownlist);*/
                            
                          } else if (buttonName == "!IMPOrTAnT") {
                            

                            shownlist = await db.getNonImportantTasks();
                           /* print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print("showing the data of ======================NON IMPORTANT==============================");
                            print(shownlist);*/
                          } else if (buttonName == "DoNe") {
                            

                            shownlist = await db.getDoneTasks();
                            /*print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print("showing the data of ======================DONE==============================");
                            print(shownlist);*/
                          }
                          

  
                        }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Business.dart';
import 'package:newsapp/NationalNews.dart';
import 'package:newsapp/Sports.dart';
import 'package:newsapp/Topnews.dart';
import 'package:share_plus/share_plus.dart';


class Newsapp extends StatefulWidget {
  const Newsapp({super.key});

  @override
  State<Newsapp> createState() => _NewsappState();
}

class _NewsappState extends State<Newsapp> with SingleTickerProviderStateMixin {
  
  late  TabController _tabcontroller;
  bool isDark=true;
  
 
  @override
  void initState() {
    super.initState();
    _tabcontroller=TabController(length: 4, vsync: this);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        
        backgroundColor: Colors.white,
        child: Column(
          children: [
            SizedBox(height:30),
            Card(elevation: 0,
              child: InkWell(
                onTap: ()
                {
                  setState(() {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Nationalnews()));
                  });
                },
                child: ListTile(
                          
                leading: Text("National"),
                
                ),
              ),
            ),
            InkWell(
              onTap: ()
              {
                setState(() {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Topnews()));
                });
              },
              child: ListTile(
                leading: Text("Top News"),
              
              ),
            ),
            InkWell(
              onTap: ()
              {
                setState(() {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Business()));
                });
              },
              child: ListTile(
                leading: Text("Tech News"),
            
              
              ),
            ),
            InkWell(
              onTap: ()
              {
                setState(() {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sports()));
                });
              },
              child: ListTile(
                leading: Text("Sports"),
              
              ),
            ),

             InkWell(
              onTap: ()
              {
                setState(() {
                  Share.share("https://play.google.com/store/apps/details?id=com.diandian.gog");
                });
              },
               child: ListTile(
                leading: Text("Share"),
                trailing: Icon(FontAwesomeIcons.share),
                         
                         ),
             ),


             InkWell(
              onTap: ()
              {
                setState(() {
                  Navigator.pop(context);
                });
              },
               child: ListTile(
                trailing: Icon(Icons.cancel),

                         
                         ),
             ),





    
          ],
        ),
        
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
            
            toolbarHeight: 85,
            actions: [
              IconButton(onPressed: ()
              {

                showDialog(
                  
                context: context,
                builder: (ctx) => AlertDialog(
                  content:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Developed by:Prabin Bhattarai ©",style: 
                    TextStyle(color: Colors.black,fontSize: 12),)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  
                  title:  Text("It is an news app create by Prabin Bhattarai on 25 March 2023.It is the sample news app which includes multiples news and features",
           style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, fontSize: 16),

  ),
          
          
            /* style: TextStyle(
              color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal,
              ),*/
             ),
                  )
                
                );

                      


              }, icon: Icon(Icons.info))
            ],
            
          
            
            title: Column(
          children: [
          
            Text("The News Times",style: TextStyle(color: Colors.black,fontSize: 19),),
            Text("Without Fear or Favour",style: TextStyle(fontSize:14,fontWeight: FontWeight.normal,color: Colors.black ),),
            Text(DateTime.now().toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black),),

          ],
        ),
        bottom: TabBar(
          indicatorColor: Colors.black,
          indicatorWeight: 1,
          controller: _tabcontroller,
          tabs: [
          
          Container(
          
            width: 120,
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(7)

            ),
            height: 40,
            child: Center(child: Text("Headlines",style: TextStyle(color: Colors.black,fontSize: 12),))),
              Container(
          
            width: 120,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(7)

            ),
            height: 40,
            child: Center(child: Text("National",style: TextStyle(color: Colors.black,fontSize: 12),))),
              Container(
          
            width: 120,
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(7)

            ),
            height: 40,
            child: Center(child: Text("Sports",style: TextStyle(color: Colors.black,fontSize: 12),))),
              Container(
          
            width: 120,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(7)

            ),
            height: 40,
            child: Center(child: Text("Tech News",style: TextStyle(color: Colors.black,fontSize: 12),))),
         
        ]),

          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 0.2,
              color: Colors.black,

            ),
          ),
           SliverToBoxAdapter(
            child:Container(
              height:642,
             child: TabBarView(
                    
                    controller: _tabcontroller,
                    children: [
                      Topnews(),
                    Nationalnews(),
                  Sports(),
                    Business()
                    
                  ]
                  )
                ),
            )
           
           
        
        ]
      )
    
      );
  
  
    
    




  }
 
}
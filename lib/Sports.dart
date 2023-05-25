import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  List listofsportsnews=[];
  bool click=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingsportsnews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor:Colors.white,
      body:  Container(
      
                     child: ListView.builder(
                    
                    
                    itemCount: listofsportsnews.length,
                    itemBuilder: ((context, index) 
                                {
                    return Container(
                      height:590,
                      child: Column(
                        children: [
                                                    SizedBox(height:15),
                          Text(listofsportsnews[index]['title'].toString(), style: GoogleFonts.lato(
    textStyle:const  TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),

    
  ),),
  SizedBox(height: 9.0,),
             listofsportsnews[index]['urlToImage']==null?
             Container(
              height: 250,
              width: 350,
              color: Colors.grey,
              child:const Center(child: Text("No images Found",style: TextStyle(color: Colors.white,fontSize: 22),))):
               
                   Image.network(
                            
                            listofsportsnews[index]['urlToImage'].toString(),
                          loadingBuilder: (context, child, progress) =>
                  progress==null?child:Container(
                    height: 250,
                    width: 350,
                    child: Center(
                      child: CircularProgressIndicator(
                        
                      ),
                    ),
                    
                  ),
                  height: 250,
                  fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      width: 370,
                      color: Colors.grey,
                      child: Center(child: Text("Unable to display images",style: TextStyle(color: Colors.white),)),

                    );
                  },
                  width: 370,
                  
                          ),
                          SizedBox(height:7),
                        listofsportsnews[index]['description']==null?
                        Text("No description related to it")
                        :  Text(listofsportsnews[index]['description']),
                                                  SizedBox(height: 8,),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[

                       Text("Share the contents",style:TextStyle(color:Colors.black.withOpacity(0.3),fontSize: 16)),
                            IconButton(icon:Icon(Icons.share_sharp,color:Colors.black,size: 24),
                            onPressed: ()
                            {
                              setState(() {
                                Share.share(listofsportsnews[index]['description']);
                                
                              });
                            },),

                            
                          ]
                        )
                        ],
                      ),
                    );
                                }
                  
                    )
                                )
                    ),
    );
  }
  Future<void> gettingsportsnews()async
  {
    var url="https://newsapi.org/v2/everything?q=sports&apiKey=83ff1c1ebe38402db72bca710f99310c";
    var uri=Uri.parse(url);
    var requests=await http.get(uri);
    var output=requests.body;
    print(output.runtimeType);
    var jsondata=json.decode(output);
    print(jsondata['articles']);
    print(jsondata['articles'].runtimeType);
    
    setState(() {
      listofsportsnews=jsondata['articles'];
    });
  
  
  }
}


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import  'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  List listofbusinessnews=[];
  bool click=false;
  @override
  void initState() {
    super.initState();
    gettingbusinessnews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:  Container(
      
                     child: ListView.builder(
                    
                    
                    itemCount: listofbusinessnews.length,
                    itemBuilder: ((context, index) 
                                {
                    return Container(
                      height:550,
                      child: Column(
                        children: [
                          Text(listofbusinessnews[index]['title'].toString(), style: GoogleFonts.lato(
    textStyle:const  TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),

    
  ),),
  SizedBox(height: 9.0,),
             listofbusinessnews[index]['urlToImage']==null?
             Container(
              height: 250,
              width: 350,
              color: Colors.grey,
              child:const Center(child: Text("No images Found",style: TextStyle(color: Colors.white,fontSize: 22),))):
        
                   Image.network(
                    
                            
                            listofbusinessnews[index]['urlToImage'].toString(),
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
                  width: 370,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      width: 370,
                      color: Colors.grey,
                      child: Center(child: Text("Unable to display images",style: TextStyle(color: Colors.white),)),

                    );
                  },
                  
                          ),
                          SizedBox(height:7),
                        listofbusinessnews[index]['description']==null?
                        Text("No description related to it")
                        :  Text(listofbusinessnews[index]['description']),
                            SizedBox(height: 8,),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[

                            Text("Share the contents",style:TextStyle(color:Colors.black.withOpacity(0.3),fontSize: 16)),
                            IconButton(icon:Icon(Icons.share_sharp,color:Colors.black,size: 24),
                            onPressed: ()
                            {
                              setState(() {
                                Share.share(listofbusinessnews[index]['description']);
                                
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


  //Calling BusinessApi
  Future<void> gettingbusinessnews() async
  {
    var url="https://newsapi.org/v2/everything?q=Technology&apiKey=83ff1c1ebe38402db72bca710f99310c";
    var uri=Uri.parse(url);
    var requests=await http.get(uri);
    var output=requests.body;
    print(output.runtimeType);
    var jsondata=json.decode(output);
    print(jsondata['articles']);
    print(jsondata['articles'].runtimeType);
    
    setState(() {
      listofbusinessnews=jsondata['articles'];
    });
  
  
  }
}
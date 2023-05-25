import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Topnews extends StatefulWidget {
  const Topnews({super.key});

  @override
  State<Topnews> createState() => _TopnewsState();
}

class _TopnewsState extends State<Topnews> {
   List list=[];
   bool click=false;
   
   

   @override
  void initState() {
    
    super.initState();
    gettingtopnews();
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
     body:  Container(
      
                     child: ListView.builder(
                    
                    
                    itemCount: list.length,
                    itemBuilder: ((context, index) 
                                {
                    return Container(
                      height:415,
                      child: Column(
                        children: [
                                                    SizedBox(height:15),
                          Text(list[index]['title'].toString(), style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),

    
  ),),
  SizedBox(height: 9.0,),
                          Image.network(list[index]['urlToImage'].toString(),
                          loadingBuilder: (context, child, progress) =>
                  progress==null?child:Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        
                      ),
                    ),
                    
                  ),
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
                          Text(list[index]['description']),
                          SizedBox(height: 8,),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[

                                                 Text("Share the contents",style:TextStyle(color:Colors.black.withOpacity(0.3),fontSize: 16)),
                            IconButton(icon:Icon(Icons.share_sharp,color:Colors.black,size: 24),
                            onPressed: ()
                            {
                              setState(() {
                                Share.share(list[index]['description']);
                                
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

   Future<void> gettingtopnews()async
  {
    var url="https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=83ff1c1ebe38402db72bca710f99310c";
    var uri=Uri.parse(url);
    var requests=await http.get(uri);
    var output=requests.body;
    print(output.runtimeType);
    var jsondata=json.decode(output);
    print(jsondata['articles']);
    print(jsondata['articles'].runtimeType);

    setState(() {
      list=jsondata['articles'];
    });
  
  
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Nationalnews extends StatefulWidget {
  const Nationalnews({super.key});

  @override
  State<Nationalnews> createState() => _NationalnewsState();
}

class _NationalnewsState extends State<Nationalnews> {
  List listofnationalnews=[];
  var value=0;
  bool click=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingnationalnews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:  Container(
      
                     child: ListView.builder(
                    
                    
                    itemCount: listofnationalnews.length,
                    itemBuilder: ((context, index) 
                                {
                    return Container(
                      height:530,
                      child: Column(
                        children: [
                                                    SizedBox(height:15),
                          Text(listofnationalnews[index]['title'].toString(), style: GoogleFonts.lato(
    textStyle:const  TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),

    
  ),),
  SizedBox(height: 9.0,),
             listofnationalnews[index]['urlToImage']==null ?
             Container(
              height: 250,
              width: 350,
              color: Colors.grey,
              child:const Center(child: Text("No images Found",style: TextStyle(color: Colors.white,fontSize: 22),))):
                
                   Image.network(
                            
                            listofnationalnews[index]['urlToImage'].toString(),
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
                  
                          ),
                          SizedBox(height:7),
                        listofnationalnews[index]['description']==null?
                        Text("No description related to it")
                        :  Text(listofnationalnews[index]['description']),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[

                       Text("Share the contents",style:TextStyle(color:Colors.black.withOpacity(0.3),fontSize: 16)),
                            IconButton(icon:Icon(Icons.share_sharp,color:Colors.black,size: 24),
                            onPressed: ()
                            {
                              setState(() {
                                Share.share(listofnationalnews[index]['description']);
                                
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

//Calling API
Future<void> gettingnationalnews()async
  {
    var url="https://newsapi.org/v2/everything?q=national&apiKey=83ff1c1ebe38402db72bca710f99310c";
    var uri=Uri.parse(url);
    var requests=await http.get(uri);
    var output=requests.body;
    print(output.runtimeType);
    var jsondata=json.decode(output);
    print(jsondata['articles']);
    print(jsondata['articles'].runtimeType);
    
    setState(() {
      listofnationalnews=jsondata['articles'];
    });
  
  
  }

}
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Searchpart extends StatefulWidget {
  const Searchpart({super.key});

  @override
  State<Searchpart> createState() => _SearchpartState();
}

class _SearchpartState extends State<Searchpart> {
  TextEditingController searchitem=TextEditingController();
  List listofsearchitems=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CustomScrollView(
        slivers: [
          SliverAppBar(
            
            
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Column(
          children: [
          
            Text("The News Times",style: TextStyle(color: Colors.black,fontSize: 19),),
            Text("Without Fear or Favour",style: TextStyle(fontSize:14,fontWeight: FontWeight.normal,color: Colors.black ),),
            Text(DateTime.now().toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black),),

          ],
        ),
            
            toolbarHeight: 85,
          ),
          SliverToBoxAdapter(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: TextFormField(
                controller: searchitem,
              
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 16),
                  
                  
                  fillColor: Colors.white.withOpacity(0.1),
                  
                  filled: true,
                  hintText: "Search News",
                  hintStyle: TextStyle(color: Colors.black,fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4)
                    )
                  ),
                              focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4)
                    )
                  ),
                
                  
                  
                suffixIcon: IconButton(onPressed:  get_item_on_search
            , icon: 
                
                Icon(Icons.search,color: Colors.black,)
                ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height:550,
              child: ListView.builder(
                itemCount: listofsearchitems.length,
                itemBuilder: (context,index)
              {
                return Column(
                  children: [
                    Text(listofsearchitems[index]['title'].toString(), style: GoogleFonts.lato(
    textStyle:const  TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),

    
  ),),
  SizedBox(height: 9.0,),
             listofsearchitems[index]['urlToImage']==null ?
             Container(
              height: 250,
              width: 350,
              color: Colors.grey,
              child:const Center(child: Text("No images Found",style: TextStyle(color: Colors.white,fontSize: 22),))):
                
                   Image.network(
                            
                            listofsearchitems[index]['urlToImage'].toString(),
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
                        listofsearchitems[index]['description']==null?
                        Text("No description related to it")
                        :  Text(listofsearchitems[index]['description']),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[

                       Text("Share the contents",style:TextStyle(color:Colors.black.withOpacity(0.3),fontSize: 16)),
                            IconButton(icon:Icon(Icons.share_sharp,color:Colors.black,size: 24),
                            onPressed: ()
                            {
                              setState(() {
                                Share.share(listofsearchitems[index]['description']);
                                
                              });
                            },),

                            
                          ]
                        )
                  ],
                );
              }),
            ),
          )
        
        ]
       )
    );
  }


  Future<void> get_item_on_search()async
  {
    var url="https://newsapi.org/v2/everything?q=${searchitem.text}&from=2023-05-25&sortBy=popularity&apiKey=83ff1c1ebe38402db72bca710f99310c";
    var uri=Uri.parse(url);
    var httpresponse=await http.get(uri);
    var jsondata=json.decode(httpresponse.body);
     print(jsondata['articles']);
    print(jsondata['articles'].runtimeType);
    
    setState(() {
      listofsearchitems=jsondata['articles'];
    });

    

  }
}
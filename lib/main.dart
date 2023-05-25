import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/NewsBegins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   bool showpassword=true;
   TextEditingController titlecontroller=TextEditingController();
   TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
 body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/logo.png"),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Center(child: Text("Please  enter your credentials",style: TextStyle(color: Colors.white,fontSize: 15))),
            
            ],
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:17.0),
            child: TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(
                

                
                fillColor: Colors.white,
                
                filled: true,
                hintText: "UserName",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
    
                 focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                
                
                prefixIcon: Icon(Icons.person,color: Colors.deepPurple,)
              ),
            ),
          ),
    
    
    
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:17.0),
            child: TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                
                
                fillColor: Colors.white,
                
                filled: true,
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                            focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
    
                
                
                prefixIcon: Icon(Icons.key_rounded,color: Colors.deepPurple,)
              ),
            ),
          ),
                  SizedBox(height: 20,),
          InkWell(
            onTap: () 
            {
              setState(() {
               if(titlecontroller.text =="admin" || passwordcontroller.text=="password123")
               {
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>Newsapp()));

               }
               else
               {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect Username or Password")));

               }

               
              });
            },
            child: Container(
              width: 330,
              height: 52,
              child: Center(child: Text("SIGN IN",style: TextStyle(color: Colors.deepPurple,fontSize: 18),)),
                decoration: BoxDecoration(
                  
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(30)
                
                 
                  
                
                ),
              ),
          ),
            SizedBox(height: 20,),
    
            Text("OR LOGIN WITH",style: TextStyle(color: Colors.white,fontSize: 15),),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Row(
                      
                      children: [
    
                        Container(
                          width: 135,
                          height: 46,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Icon(Icons.facebook,color: Colors.blue,),
                              Center(child: Text("Facebook")),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            
                            color: Colors.white.withOpacity(0.7),
                            
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                              Row(
                  children: [
                    Row(
                      
                      children: [
    
                        Container(
                          width: 135,
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Icon(FontAwesomeIcons.google,color: Colors.orange.shade900,),
                              Center(child: Text("Google",style: TextStyle(color: Colors.black,fontSize: 15),)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            
                            color: Colors.white.withOpacity(0.7),
                            
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
        
    
    
        ],
      ),
    ),
);
  }
}

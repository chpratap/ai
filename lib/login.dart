 import 'package:ai/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class LOgin extends StatefulWidget {
  const LOgin({super.key});

  @override
  State<LOgin> createState() => _LOginState();
}

class _LOginState extends State<LOgin> {
TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showpassword = true;
  var a = "Invalid Email";
  void submit(name, password) {
    if (name.text == "ch.pratap1612@gmail.com") {
      if (password.text == "123456789") {
        print(
            "WELCOME " + name.text.replaceAll('@gmail.com', "").toUpperCase());
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Homepage(
                    
                    )));
      } else {
        print("Wrong Password");
      }
    } else {
      print(a);
    }
  }

   
  bool _obscureText=true;
  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
       backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
               height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width, 
                  child: Center(
                    child: Container(
                      child: Lottie.network(
                        "https://assets4.lottiefiles.com/packages/lf20_KvK0ZJBQzu.json",
                      ),
                    ),
                  ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.lock,
              size: 50,),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: Colors.white,
                 controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                
                  labelText: "user name",suffixIcon: Icon(Icons.person),
                  hintText:"user name", 
                ),
              ),
            ),
             Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: _obscureText,
                 controller: password,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                     setState(() {
                        _obscureText=!_obscureText;
                     });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off:Icons.visibility
                    ),
                  ),
                  
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText:" Password", 
                ),
              ),
            ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                   padding: EdgeInsets.all(10),
                  child: TextButton(onPressed: ( ){
                     setState(() {
                       submit(name, password);
                     });
                  }, child:  Text(" Login",
                                style: TextStyle(
                                    color: Colors.black),)),
                ),
                 Container(
                   padding: EdgeInsets.all(10),
                  child: TextButton(onPressed: ( ){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Signup()));
                  }, child:  Text(" Signup", 
                                style: TextStyle(
                                    color: Colors.black),)),
                ),
              
              ],
            )
            
          ],
          
        ),
        
      ),
      
 
    );
  }
}
import 'dart:convert';

import 'package:ai/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
   TextEditingController cpassword = TextEditingController();
  bool showpassword = true;
  var a = "Invalid Email";
  void submit(name, password,cpassword) {
    if (name.text == "ch.pratap1612@gmail.com") {
      if (password.text == "123456789") {
        
      if(cpassword.text=="123456789"){ 
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Homepage(
                    
                    )));
      }else{
        print("Wrong Password");
      }
      }
      else {
        print("Wrong Password");
      }
    } else {
      print(a);
    }
  }

  var selectedlist = ['select gender', 'male', 'female'];
  String dropdownvalue = 'select gender';
  bool _obscureText = true;
  bool _obscureTextconform=true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown,
      body: SingleChildScrollView(
        child: Column(
          children: [ 
             Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color:Colors.brown,
                child: Center(
                  child: Container(
                    child: Lottie.network(
                        "https://assets7.lottiefiles.com/packages/lf20_nUTP5Vd52q.json"),
                  ),
                ),
              ),
            Container(
              
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First Name",suffixIcon: Icon(Icons.person),
                  hintText: "First Name",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last Name",suffixIcon: Icon(Icons.person),
                  hintText: "Last Name",
                ),
              ),
            ),
            Row(
              children: [
                Padding(padding:EdgeInsets.all(10)),
                Text("Gender"),
                SizedBox(width: 30,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton(
                      value: dropdownvalue,
                      items: selectedlist.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (item) {
                        setState(() {
                          dropdownvalue = item!;
                        });
                      }),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                
                controller: name,
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(),
                  labelText: " Gmail",suffixIcon: Icon(Icons.mail),
                  hintText: " Gmail",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                     setState(() {
                       _obscureText=!_obscureText;
                     });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: " Password",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: cpassword,
                obscureText: _obscureTextconform,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector( 
                    onTap: () {
                     setState(() {
                       _obscureTextconform=!_obscureTextconform;
                     });
                    },
                    child: Icon(
                        _obscureTextconform ? Icons.visibility_off : Icons.visibility),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Conform Password",
                  hintText: "Conform Password",
                ),
              ),
            ),
   
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> LOgin()));
                        },
                      child: Text(" Login",
                        style: TextStyle(color: Colors.black), 
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                       setState(() {
                          submit(name,password,cpassword);
                        
                       });
                      },
                      child: Text(" Signup",
                      style: TextStyle(color: Colors.black),)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

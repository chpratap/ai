import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  _HomepageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "500d13d12df3298ad7f96be787b2435e2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 15, 47),
        title: Text("AI"),
      ),
      drawer: Drawer(backgroundColor: Colors.purple,
      child: ListView(
        
         padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        children: [ 
          Padding(padding:  EdgeInsets.all(20)),
          Center(child: Text("HOME")),
          ListTile(
             title: Text('A I'),
          ),
           ListTile(
             title: Text('Login'),
          ),
           ListTile(
             title: Text('Signup'),
          ),
           ListTile(
             title: Text('Logout'),
          ),
           ListTile(
             title: Text('About'),
          )
        ],
      ),
      ), 
      body: Container(
          child: Center(
                    child: Container(
               height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width, 
                  color:Colors.brown,
                      child: Lottie.network(
                        "https://assets6.lottiefiles.com/packages/lf20_zrqthn6o.json",
                      ),
                    ),
                  ),
      ),
    );
  }
}
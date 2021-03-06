import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nodeflutter/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  dynamic data='hey';
  Future<void> getdata() async {
   var result= await http_get('get');
   setState(() {
     data= result.data.toString();
   });
   
   print(result.data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
       child: Column(
         children: [
           SizedBox(height: 100,),
           FlatButton(child: Text('fetch data from server'),
           onPressed:()async=> await getdata(),
           color: Colors.blue,
           )
           ,Center(child: Text(data),),
         ],
       )
      ),
    );
  }
}


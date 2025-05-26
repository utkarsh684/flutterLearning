import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatbotPage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text(
            "Fox AI",
                style: TextStyle(
            fontFamily: 'Anton',
                  fontSize: 30,
                  color: Colors.white30,
        ),
        ),
      ),
      body: Center(
        child:Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/1000022636-removebg-preview.png'),
              fit: BoxFit.cover,
            )
          ),
        )
      ),
    );
  }
}

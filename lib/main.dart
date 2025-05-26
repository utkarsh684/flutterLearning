import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/loginPage.dart';
import 'dart:convert';

import 'package:myapp/splashScreen.dart';

void main() {
  runApp(ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      home: loginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  bool _showBrainstormButton = true;
  String _response = '';

  Future<void> sendMessage(String message) async {
    final url = Uri.parse('http://192.168.1.100:10000/chat');
    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );
      final json = jsonDecode(res.body);
      setState(() {
        _response = json['reply'];
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          backgroundColor:Colors.black,
          title: Text(
              'Fox AI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Anton',
          ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Text(
                "What can I help with ?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            if (_showBrainstormButton)
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,50.0,8.0,0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.text = "Brainstorm";
                          _showBrainstormButton = false;
                        }
                        );
                        SizedBox(width: 20);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.grey[900],
                        side: BorderSide(color: Colors.grey, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                          "Brainstorm",
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.text = "Diet";
                          _showBrainstormButton = false;
                        });
                        SizedBox(width: 20);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.grey[900],
                        side: BorderSide(color: Colors.grey, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      child: Text(
                          "Diet",
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.text = "Get Advice";
                          _showBrainstormButton = false;
                        });
                        SizedBox(width: 20);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.grey[900],
                        side: BorderSide(color: Colors.grey, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                          "Get Advice",
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,55.0,30.0,20.0),
              child: TextField(controller: _controller, decoration: InputDecoration(hintText: 'Type a message...')),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                sendMessage(_controller.text);
              },
              child: Text('Send'),
            ),
            SizedBox(height: 20),
            Text(_response),
          ],
        ),
      ),
    );
  }
}



  
  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/signUpPage.dart';

class loginPage extends StatefulWidget {
   loginPage({super.key});
  @override
  State<loginPage> createState() => _loginPageState();

}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
            "WELCOME BACK !",
          style: TextStyle(
            color: Colors.black45,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/icons/TS5qcGc.webp',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0,80.0,0.0,0.0),
                      child: Text(
                        "E-MAIL :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(6.0, 4.0, 18.0, 0.0),
                      child: TextField(
                        controller: controller2,
                        decoration: InputDecoration(hintText: 'Email...'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "Password :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 8.0, 18.0, 0.0),
                      child: TextField(
                        controller: controller3,
                        decoration: InputDecoration(hintText: 'Password...'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,0.0),
                      child: SizedBox(
                        width:250,
                        height: 34,
                        child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12,
                              shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),  // Set corner radius
                        ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChatbotPage()),
                            );
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color:Colors.white
                            ),
                          ),

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(250.0,710.0,0.0,0.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.tealAccent
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signUpPage()),
                );
              },
              child: Text("SIGNUP"),
            ),
          ),
          Positioned(
            top: 238,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/icons/img.png'),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );

  }
}

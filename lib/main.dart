import 'dart:convert';

import 'package:music/login.dart';

import 'music.dart';
import 'login.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => const MyLogin(),
        '/register': (context) => MyRegister(),
        '/music': (context) => const MyMusic(),
      },
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool eye = true;
  var username = '';
  var password = '';

  List User = [
    {'username': 'heinminaye', 'password': '1234pss'}
  ];

  bool check = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 78, 78, 78)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ))),
            ]),
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const Image(
                    image: AssetImage('images/music_group.png'),
                    width: 500,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Music Player",
                    style: GoogleFonts.sacramento(
                        color: Colors.white, fontSize: 40),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

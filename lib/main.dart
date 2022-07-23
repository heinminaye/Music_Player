import 'dart:convert';

import 'music.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage('images/Mu.png'),
                            width: 280,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextField(
                            controller: usernameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white70,
                              ),
                              hintText: "Enter your username",
                              hintStyle: TextStyle(color: Colors.white38),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 177, 177, 177)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: eye,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                hintText: "Enter your password",
                                hintStyle:
                                    const TextStyle(color: Colors.white38),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white70,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 177, 177, 177)),
                                ),
                                suffixIcon: IconButton(
                                    splashRadius: 5,
                                    iconSize: 20,
                                    onPressed: () {
                                      setState(() {
                                        eye = !eye;
                                      });
                                    },
                                    icon: eye
                                        ? const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white54,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.white54,
                                          ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      print(
                                          '${usernameController.text} ${passwordController.text}');

                                      if (usernameController.text ==
                                              User[0]['username'] &&
                                          passwordController.text ==
                                              User[0]['password']) {
                                        print(">>>>>>>>User login");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyMusic()),
                                        );
                                      } else {
                                        const snackBar = SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'Login Failed',
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    });
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

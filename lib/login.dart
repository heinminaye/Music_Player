import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';

import 'music.dart';
import 'main.dart';
import 'main.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final prefs = SharedPreferences.getInstance();
  bool eye = true;

  bool _checkVal = false;

  void _submit() async {
    SharedPreferences _prefs = await prefs;
    if (_errorText == null && _errorUserText == null) {
      final String? username = _prefs.getString('username');
      final String? password = _prefs.getString('password');
      if (username == usernameController.text &&
          password == passwordController.text) {
        Navigator.pushNamed(context, '/music')
            .then((value) => passwordController.clear());
      } else {
        const snackBar = SnackBar(
          duration: Duration(milliseconds: 900),
          content: Text('Login Failed'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  String? get _errorUserText {
    final usertext = usernameController.value.text;

    if (usertext.isEmpty) {
      return "Can't be empty";
    }
    return null;
  }

  String? get _errorText {
    final psstext = passwordController.value.text;

    if (psstext.isEmpty) {
      return "Can't be empty";
    }
    return null;
  }

  bool check = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _text = '';
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
                          Row(
                            children: [
                              IconButton(
                                splashRadius: 20,
                                onPressed: () {
                                  Navigator.pop(context, '/register');
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Image(
                            image: AssetImage('images/Mu.png'),
                            width: 250,
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
                            decoration: InputDecoration(
                              labelText: "Username",
                              errorText: _checkVal ? _errorUserText : null,
                              labelStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white70,
                              ),
                              hintText: "Enter your username",
                              hintStyle: const TextStyle(color: Colors.white38),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 177, 177, 177)),
                              ),
                            ),
                            onChanged: (text) => setState(() => _text),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: eye,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                errorText: _checkVal ? _errorText : null,
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
                            onChanged: (text) => setState(() => _text),
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
                                      setState(() {
                                        if (passwordController
                                                .value.text.isNotEmpty &&
                                            usernameController
                                                .value.text.isNotEmpty) {
                                          _submit();
                                        } else {
                                          _checkVal = true;
                                        }
                                      });
                                    });
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.white60),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
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

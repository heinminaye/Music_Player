import 'dart:convert';

import 'music.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRegister extends StatefulWidget {
  MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _HomeState();
}

class _HomeState extends State<MyRegister> {
  final prefs = SharedPreferences.getInstance();
  bool eye = true;
  bool _validate = false;

  String? get _errorText {
    final psstext = passwordController.value.text;

    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (psstext.isEmpty) {
      return "Can't be empty";
    }
    if (psstext.length < 6) {
      return "Password Must be more than 6 characters";
    }
    if (!regex.hasMatch(psstext)) {
      return "Password should contain upper,lower,digit and Special character ";
    }
    return null;
  }

  void _submit() async {
    SharedPreferences _prefs = await prefs;
    if (_errorText == null && _errorUserText == null) {
      _prefs.setString("password", passwordController.text);
      _prefs.setString("username", usernameController.text);
      Navigator.pushNamed(context, '/login')
          .then((value) => passwordController.clear());
    }
  }

  String? get _errorUserText {
    final usertext = usernameController.value.text;

    if (usertext.isEmpty) {
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
                            image: AssetImage('images/register.png'),
                            width: 300,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Register",
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
                                errorText: _validate ? _errorUserText : null,
                                labelText: "Username",
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                ),
                                hintText: "Enter your username",
                                hintStyle:
                                    const TextStyle(color: Colors.white38),
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
                              ),
                              onChanged: (text) => setState(() {
                                    _errorText;
                                  })),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: eye,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              errorText: _validate ? _errorText : null,
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(color: Colors.white38),
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
                                    color: Color.fromARGB(255, 177, 177, 177)),
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
                                        )),
                            ),
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
                                      if (passwordController
                                              .value.text.isNotEmpty &&
                                          usernameController
                                              .value.text.isNotEmpty) {
                                        _submit();
                                      } else {
                                        _validate = true;
                                      }
                                    });
                                  },
                                  child: const Text(
                                    'REGISTER',
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
                                "Already have an account?",
                                style: TextStyle(color: Colors.white60),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text(
                                  'Login',
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

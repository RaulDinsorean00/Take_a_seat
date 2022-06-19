import 'package:flutter/material.dart';
import 'package:flutter_takeaseat/config/config.dart';
import 'package:flutter_takeaseat/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

var loginEmail = TextEditingController();
var loginPassword = TextEditingController();

var registerName = TextEditingController();
var registerEmail = TextEditingController();
var registerPassord = TextEditingController();

var activated = false;

class _ProfilePageState extends State<ProfilePage> {
  String step = 'main';
  late SharedPreferences prefs;
  String token = '';
  String error = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      prefs = await SharedPreferences.getInstance();
      if (prefs.getString('token') != null) {
        token = prefs.getString('token')!;
        step = 'profile';
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 245, 255),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                if (step == 'main' && token == '') ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 150, bottom: 150.0),
                    child: MaterialButton(
                      height: 100.0,
                      minWidth: 300.0,
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () {
                        step = 'login';
                        setState(() {});
                      },
                      color: Color.fromARGB(255, 165, 208, 246),
                    ),
                  ),
                  MaterialButton(
                    height: 100.0,
                    minWidth: 300.0,
                    child: const Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () {
                      step = 'signup';
                      setState(() {});
                    },
                    color: Color.fromARGB(255, 165, 208, 246),
                  ),
                ] else if (step == 'login') ...[
                  // ################################## LOGIN CONTAINER ##################################
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 100.0, left: 40.0),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                            ),
                            controller: loginEmail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0, left: 40.0),
                          child: Text(
                            'Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 15.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                            controller: loginPassword,
                          ),
                        ),
                        Text(error),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(63),
                      ),
                      color: Color.fromARGB(255, 165, 208, 246),
                    ),
                    height: 500,
                    width: 300,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: MaterialButton(
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            color: Color.fromARGB(255, 165, 208, 246),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            minWidth: 220,
                            height: 70,
                            onPressed: () async {
                              try {
                                String token = await api.loginUser(
                                  loginEmail.text,
                                  loginPassword.text,
                                );
                                prefs.setString('token', token);
                                step = 'profile';
                                setState(() {});
                              } catch (e) {
                                error = e.toString();
                                setState(() {});
                                print(e);
                              }
                            },
                          ),
                        ),
                        MaterialButton(
                          child: Text(
                            'Back',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          color: Color.fromARGB(255, 165, 208, 246),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          minWidth: 120,
                          height: 50,
                          onPressed: () {
                            step = 'main';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )
                ] else if (step == 'signup') ...[
                  // ################################## SIGN UP CONTAINER ##################################
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 40.0),
                          child: Text(
                            'Name',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                            ),
                            controller: registerName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, left: 40.0),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                            ),
                            controller: registerEmail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, left: 40.0),
                          child: Text(
                            'Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 15.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                            controller: registerPassord,
                          ),
                        ),
                        Text(error),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(63),
                      ),
                      color: Color.fromARGB(255, 165, 208, 246),
                    ),
                    height: 500,
                    width: 300,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: MaterialButton(
                            child: Text(
                              'Create account',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            color: Color.fromARGB(255, 165, 208, 246),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            minWidth: 220,
                            height: 70,
                            onPressed: () async {
                              try {
                                String token = await api.registerUser(
                                  registerName.text,
                                  registerEmail.text,
                                  registerPassord.text,
                                );
                                prefs.setString('token', token);
                                step = 'profile';
                                setState(() {});
                              } catch (e) {
                                error = e.toString();
                                setState(() {});
                                print(e);
                              }
                            },
                          ),
                        ),
                        MaterialButton(
                          child: Text(
                            'Back',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          color: Color.fromARGB(255, 165, 208, 246),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          minWidth: 120,
                          height: 50,
                          onPressed: () {
                            step = 'main';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )
                ] else if (step == 'profile') ...[
                  // ################################## PROFILE CONTAINER ##################################
                  FutureBuilder<User>(
                    future: api.getUser(prefs.getString('token')!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(63),
                            ),
                            color: Color.fromARGB(255, 165, 208, 246),
                          ),
                          height: 600,
                          width: 300,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text(
                                  snapshot.data!.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, bottom: 30),
                                child: Container(
                                  height: 240.0,
                                  width: 240.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/QR_code.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 10,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: !activated
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: MaterialButton(
                                      child: Text(
                                        'Activate your ticket',
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.black),
                                      ),
                                      color: Color.fromARGB(255, 238, 245, 255),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      minWidth: 220,
                                      height: 70,
                                      onPressed: () {
                                        activated = true;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: MaterialButton(
                                      child: Text(
                                        'Log out',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      color: Color.fromARGB(255, 238, 245, 255),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      minWidth: 120,
                                      height: 50,
                                      onPressed: () {
                                        prefs.remove('token');
                                        token = '';
                                        step = 'main';
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Container();
                    },
                  ),
                ]
              ],
            ),
          ),
        ],
      ));
}

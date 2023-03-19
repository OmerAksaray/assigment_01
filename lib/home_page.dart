import 'package:assigment_interface_app/change_password.dart';
import 'package:assigment_interface_app/login_page.dart';
import 'package:assigment_interface_app/refactor_page.dart';
import 'package:assigment_interface_app/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  void passLogin() {
    print('Login sayfasina yönlendiriliyor');
  }

  void passSignUp() {
    print('Sign Up sayfasina yonlendiriliyor');
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 76, 25, 164),
          title: Text('Home Page'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 240,
                  width: 400,
                  child: Lottie.asset(
                    'assets/05.json',
                  ),
                ),
                forText(upText: 'Do you have an account?'),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text(
                        'Login!',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 76, 25, 164)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ),
                  ),
                ),
                forText(
                  upText: 'If you want to creat an account! ',
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sign_up_page(),
                            ));
                      },
                      child: Text(
                        'Sign Up!',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 76, 25, 164)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ),
                  ),
                ),
                forText(
                  upText: 'If you want to change your password',
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ));
                      },
                      child: Text(
                        'Change Password!',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 76, 25, 164)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

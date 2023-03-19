import 'package:assigment_interface_app/home_page.dart';
import 'package:assigment_interface_app/login_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Forgot_Page extends StatefulWidget {
  const Forgot_Page({super.key});

  @override
  State<Forgot_Page> createState() => _Forgot_PageState();
}

final _forgotKey = GlobalKey<FormState>();

class _Forgot_PageState extends State<Forgot_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            ),
          ),
          title: Text(
            'Did you forget your password?',
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 76, 25, 164),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _forgotKey,
              child: Column(
                children: [
                  SizedBox(
                    child: Lottie.asset('assets/03.json'),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Please enter your e-mail address and we will send you your password.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(CupertinoIcons.envelope, color: Colors.black),
                        hintText: 'Please enter your email here',
                        labelText: 'E-mail',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        bool forgotValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return "Enter E-mail";
                        } else if (!forgotValid) {
                          return "Enter Valid E-mail";
                        }
                      },
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          if (_forgotKey.currentState!.validate()) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              showCloseIcon: true,
                              title: "Success",
                              desc: "Change link sended to you!",
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              showCloseIcon: true,
                              title: "Warning!",
                              desc: "Please check your information!",
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        child: Text(
                          'Send my password!',
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
            ),
          ),
        ),
      ),
    );
  }
}

void sendPassword() {
  print("Password sended");
}

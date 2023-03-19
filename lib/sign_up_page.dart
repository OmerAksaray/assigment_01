import 'package:assigment_interface_app/home_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({super.key});

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

final _signKey = GlobalKey<FormState>();

class _sign_up_pageState extends State<sign_up_page> {
  bool passwordToggle = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
          ),
          title: Text(
            'Sign Up Page!',
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 76, 25, 164),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _signKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Please fill in the information requested below to sign up.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(CupertinoIcons.person, color: Colors.black),
                        hintText: 'Please enter your name here',
                        labelText: 'Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(CupertinoIcons.person, color: Colors.black),
                        hintText: 'Please enter your surname here',
                        labelText: 'Surname',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(CupertinoIcons.phone, color: Colors.black),
                        hintText: 'Please enter your phone number here',
                        labelText: 'Phone Number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a Phone Number";
                        } else if (!RegExp(
                                r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                            .hasMatch(value)) {
                          return "Please Enter a Valid Phone Number";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
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
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return "Enter E-mail";
                        } else if (!emailValid) {
                          return "Enter Valid E-mail";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                        obscureText: passwordToggle,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(CupertinoIcons.lock, color: Colors.black),
                            hintText: 'Please enter your password here',
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passwordToggle = !passwordToggle;
                                });
                              },
                              child: Icon(passwordToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password!";
                          } else if (value.length < 6) {
                            return "Password Length Should  be more than 6 characters";
                          }
                        }),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: SizedBox(
                      height: 50,
                      width: 260,
                      child: TextButton(
                        onPressed: () {
                          if (_signKey.currentState!.validate()) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              showCloseIcon: true,
                              title: "Success",
                              desc: "You are registered!",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void signed() {
  print('Kaydedildi');
}

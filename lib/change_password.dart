import 'package:assigment_interface_app/home_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

final _changeKey = GlobalKey<FormState>();

class _ChangePasswordState extends State<ChangePassword> {
  bool onePassToggle = true;
  bool onePass2Toggle = true;
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
            'Change Password Page!',
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 76, 25, 164),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _changeKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 300,
                    child: Lottie.asset('assets/04.json'),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Please fill in the information requested below to change password.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(CupertinoIcons.person, color: Colors.black),
                        hintText: 'Please enter your e-mail here',
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
                        obscureText: onePassToggle,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(CupertinoIcons.lock, color: Colors.black),
                            hintText: 'Please enter your old password here',
                            labelText: 'Old Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  onePassToggle = !onePassToggle;
                                });
                              },
                              child: Icon(onePassToggle
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
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                        obscureText: onePass2Toggle,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(CupertinoIcons.lock, color: Colors.black),
                            hintText: 'Please enter your new password here',
                            labelText: 'New Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  onePass2Toggle = !onePass2Toggle;
                                });
                              },
                              child: Icon(onePass2Toggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password!";
                          } else if (value.length < 6) {
                            return "New Password Length Should  be more than 6 characters";
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
                          if (_changeKey.currentState!.validate()) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              showCloseIcon: true,
                              title: "Success",
                              desc: "Password changed successfully!",
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
                          'Change my password!',
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

void changed() {
  print('Sifre degistirildi');
}

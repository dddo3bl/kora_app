import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kora/screens/singin_singup/pallete.dart';

import 'widget/back-ground0image.dart';

class ForgatePassword extends StatefulWidget {
  const ForgatePassword({Key? key}) : super(key: key);

  @override
  _ForgatePasswordState createState() => _ForgatePasswordState();
}

class _ForgatePasswordState extends State<ForgatePassword> {
  TextEditingController email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackGroundImage(
          image: 'assets/images/register_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              'Forgot Password',
              style: kbodytext,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'Enter your email we will send instruction to rest your password',
                        style: kbodytext,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 30,
                                color: kwhite,
                              ),
                            ),
                            hintText: 'Email',
                            hintStyle: kbodytext,
                          ),
                          style: kbodytext,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.blue,
                      ),
                      child: FlatButton(
                        onPressed: () {
                          print(email.text);
                          // Navigator.pushNamed(context, 'mainpages');
                        },
                        child: Text(
                          "LogIn",
                          style: kbodytext,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

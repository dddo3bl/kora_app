import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/singin_singup/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widget/back-ground0image.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confpassword = new TextEditingController();
  late User user ;

void initState() {
    user = UserPreferences.getUser();
    super.initState();
  }

  createAccount() async {
    print("object");
    var url = "http://10.0.2.2:3000/users/regester";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "name": username.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      var responsbody = jsonDecode(response.body);
      user = user.copy(
        id:responsbody['data']['id'],
        name: username.text,
        email: email.text,
      );
      UserPreferences.setUser(user);
      Navigator.pushReplacementNamed(context, 'verifictionpage');
    } else {
      print(response.statusCode.toString() + response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackGroundImage(image: 'assets/images/register_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.2,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kwhite,
                            width: 2,
                          ),
                        ),
                        child: Icon(FontAwesomeIcons.arrowUp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
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
                          controller: username,
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
                            hintText: 'UserName',
                            hintStyle: kbodytext,
                          ),
                          style: kbodytext,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        )),
                      ),
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
                          controller: phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 30,
                                color: kwhite,
                              ),
                            ),
                            hintText: 'Phone',
                            hintStyle: kbodytext,
                          ),
                          style: kbodytext,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        )),
                      ),
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
                          controller: password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 30,
                                color: kwhite,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: kbodytext,
                          ),
                          obscureText: true,
                          style: kbodytext,
                          textInputAction: TextInputAction.next,
                        )),
                      ),
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
                          controller: confpassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 30,
                                color: kwhite,
                              ),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: kbodytext,
                          ),
                          obscureText: true,
                          style: kbodytext,
                          textInputAction: TextInputAction.done,
                        )),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    // buttom start
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.blue,
                      ),
                      child: FlatButton(
                        onPressed: createAccount,
                        child: Text(
                          "LogIn",
                          style: kbodytext,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: kbodytext,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            'Login ',
                            style: kbodytext.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

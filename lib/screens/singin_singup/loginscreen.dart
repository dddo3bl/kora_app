import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/mainpages/requests/controller/teamleadercontroller.dart';
import 'package:kora/screens/singin_singup/pallete.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'widget/back-ground0image.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late User user ;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  
  void initState() {
    user = UserPreferences.getUser();
    super.initState();
  }
  login() async {
    var url = "http://10.0.2.2:3000/users/login";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({"email": email.text, "password": password.text}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    var responsbody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(responsbody);
      user = user.copy(
        id:responsbody['result'][0]['user_id'],
        name: responsbody['result'][0]['user_name'],
        email: responsbody['result'][0]['email'],
        playerPlace: responsbody['result'][0]['playerPlace'],
        age: responsbody['result'][0]['age'],
        hight: responsbody['result'][0]['hight'],
        weight: responsbody['result'][0]['weight'],
      );
      UserPreferences.setUser(user);
      Navigator.pushReplacementNamed(context, 'myapp');
    }else{
      print("not ok");
    }
  }
  String? emailValidator(String? val){
    if(val!.trim().isEmpty){
      return "its empty";
    }else if(val.trim().length < 20){
      return "Must contains 10 Letirles";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return login_widget(size, context);
  }

  Stack login_widget(Size size, BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Koora Dafory',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                          child: TextFormField(           
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
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
                          child: TextFormField(
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
                        textInputAction: TextInputAction.done,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "forgatepassword"),
                    child: Text(
                      "Forget Password",
                      style: kbodytext,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.blue,
                    ),
                    child: FlatButton(
                      onPressed: (){
                        login();
                      },
                      child: Text(
                        "LogIn",
                        style: kbodytext,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'createnewaccount'),
                child: Container(
                  child: Text(
                    "Create Account",
                    style: kbodytext,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kwhite))),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}

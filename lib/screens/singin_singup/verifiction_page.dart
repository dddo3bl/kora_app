import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:http/http.dart' as http;

import 'pallete.dart';
import 'widget/back-ground0image.dart';

class VerifictionPage extends StatefulWidget {
  const VerifictionPage({Key? key}) : super(key: key);

  @override
  _VerifictionPageState createState() => _VerifictionPageState();
}

class _VerifictionPageState extends State<VerifictionPage> {
  TextEditingController verifiction = TextEditingController();
  String id = "";
  late User user ;

void initState() {
    user = UserPreferences.getUser();
    super.initState();
  }



  confirm() async {
    var url = "http://10.0.2.2:3000/users/verifiy";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({"id": user.id, "token": verifiction.text}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    var resbonsbody = jsonDecode(response.body);
    print(resbonsbody['result'][0]['email']);
    if (resbonsbody['verified'] == true) {
      user.copy(
        email: resbonsbody['result'][0]['email'],
        name: resbonsbody['result'][0]['user_name'],
      );
      UserPreferences.setUser(user);
      Navigator.pushReplacementNamed(context, "mainpages");
    } else {
      print("end");
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Verifiy your account first',
              style: kbodytext,
            ),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                width: size.width * 0.8,
                child: Text(
                  'Enter your verifiction code',
                  style: kbodytext,
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: Text(
                  'The verifiction code will end after 1 min',
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
                    controller: verifiction,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Icon(
                          FontAwesomeIcons.lock,
                          size: 30,
                          color: kwhite,
                        ),
                      ),
                      hintText: 'Enter The Code',
                      hintStyle: kbodytext,
                    ),
                    style: kbodytext,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
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
                    // print(verifiction.text);
                    confirm();
                    // Navigator.pushNamed(context, 'mainpages');
                  },
                  child: Text(
                    "Verifiy",
                    style: kbodytext,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resend the code ',
                    style: kbodytext,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      'Click here ',
                      style: kbodytext.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ],
    );
  }
}

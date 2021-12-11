import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';



AppBar buildAppBar(BuildContext context){
  final icon = CupertinoIcons.moon_stars;

  delpref() async {
  UserPreferences.delPref();
}

  return AppBar(
    leading: IconButton(
      onPressed: (){
        delpref();
        print(UserPreferences.getUser().id);
        Navigator.pushNamed(context, "myapp");
        print(UserPreferences.getUser().id);
      },
      icon: Icon(Icons.logout_outlined)
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(onPressed: (){}, 
      icon: Icon(icon)
      )
    ],
  );
}
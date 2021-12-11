import 'dart:convert';

import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    id: 0,
    imagePath:'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80', 
    name:'', 
    email:'', 
    about:'', 
    isDarkMode:false,
    playerPlace:0,
    age: 0,
    weight: 0,
    hight: 0,
    inteam: false,
    team_id: null,
    teamleader: false
  );

  static Future init()async{
    return _preferences = await SharedPreferences.getInstance();
  } 

  static Future setUser(User user )async{
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser(){
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }

  static delPref(){
    _preferences.clear();
  }
  
}
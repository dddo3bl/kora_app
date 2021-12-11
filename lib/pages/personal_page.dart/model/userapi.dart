

import 'dart:convert';

import 'package:http/http.dart';
import 'package:kora/modules/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';

import 'user_module.dart';


class API{
  static final String savePersonalInfo = 'http://10.0.2.2:3000/users/updateInfo';
  static Future<Response> savedata(usrlist,id) async{
    final Response respons = await post(Uri.parse(savePersonalInfo),
    body: jsonEncode({
      'userlist':usrlist,
      'placeid':id}),
    headers: {
      'Content-type': 'application/json',
        'Accept': 'application/json'
    }
    );
    if(respons.statusCode == 200 ){
      
    }else{
      print("error");
    }
  return respons;
  }
  static final User user = UserPreferences.getUser();
  static final String PersonalInfoUri = 'http://10.0.2.2:3000/users/getinteam';
   Future<List<Users>> getPersonalInfo() async{
    print(user.id);
    final Response response = await post(Uri.parse(PersonalInfoUri),
    body: jsonEncode({
      "id":user.id
    }),
    headers: {
      'Content-type': 'application/json',
        'Accept': 'application/json'
    }
    );
    var responsebode = jsonDecode(response.body) as List; 
      return responsebode.map((users) => Users.fromJson(users)).toList();
  }

}
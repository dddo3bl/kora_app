

import 'dart:convert';
import 'package:http/http.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/module/myteamplayers_moduel.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/module/showmyteaminfo_module.dart';

class MyTeamService{
  static User user = UserPreferences.getUser();
  static final String myteaminfoUri = 'http://10.0.2.2:3000/team/showmyteaminfo';
  Future<List<ShowMyTeamInfo>> showMyTeamInfo() async{
   

    final Response response = await post(
      Uri.parse(myteaminfoUri),
      body : jsonEncode({
        "id": user.id
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      });
      var responsebode = jsonDecode(response.body) as List; 
      // print(responsebode);
      return responsebode.map((users) => ShowMyTeamInfo.fromJson(users)).toList();
  }

  static final String myteamplayrsUri = 'http://10.0.2.2:3000/team/getteamplayers';
  static Future myteamplayrs() async{
    print(user.id);
    final Response response = await post(
      Uri.parse(myteamplayrsUri),
      body : jsonEncode({
        "id": user.id
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      });
      var responsebode = jsonDecode(response.body) as List; 
      print(responsebode);
      return responsebode;
  }


  }





import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';

class TeamLeaderControllers extends ChangeNotifier{

 User user = UserPreferences.getUser(); 
 bool teamLeader = false;

 getteamleader()async{
   String isteamLeaderUri = "http://10.0.2.2:3000/users/isteamleader";
    Response response = await post(Uri.parse(isteamLeaderUri),
    body: jsonEncode({
      "userid":user.id
    }),
    headers: {
      'Content-type': 'application/json',
        'Accept': 'application/json'
    }
    );
    List responsebody = jsonDecode(response.body) as List;
    // print(responsebody);
    if(responsebody.isEmpty){
        teamLeader = false;
    }else{
        teamLeader = true;
    }
    // print(teamLeader);
    notifyListeners();
 }

}
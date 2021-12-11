

import 'dart:convert';

import 'package:http/http.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:provider/provider.dart';

class GetAllUsers{

  static final String getallUsersUri = "http://10.0.2.2:3000/users/getallusers";
  static Future getAllUsers(int areaid) async{
    // BuildAreaController getareafromProvider = BuildAreaController();
    // print(getareafromProvider.chosen.area_id);
    final Response response = await post(
      Uri.parse(getallUsersUri),
      body:jsonEncode({
        "areaid":areaid
      }) ,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
    );
    List responsbody = jsonDecode(response.body) as List ;
    print(responsbody);
    return responsbody;
  }

  static final String getinfoOfPlayer = "http://10.0.2.2:3000/users/getinfoofplayer";
  static Future getinfofPlayer(userid)async{
    Response response = await post(
      Uri.parse(getinfoOfPlayer),
      body: jsonEncode({
        "userid":userid
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
    );
    List responsbody = jsonDecode(response.body) as List;
    return responsbody;

  }
}
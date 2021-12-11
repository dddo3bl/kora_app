

import 'dart:convert';

import 'package:http/http.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';

class RequestsApi{

  
  static String getRequestsUri = "http://10.0.2.2:3000/team/gettoplayer";
   
  static Future getRequests() async{
  User user = UserPreferences.getUser();
    final Response response = await post(
      Uri.parse(getRequestsUri),
      body: jsonEncode({
        "userid":user.id
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
      );
    List responsbody = jsonDecode(response.body) as List;
    print(responsbody);
    return responsbody;

  }

  static String responseJoinToTeamUri = "http://10.0.2.2:3000/team/responsetojoin";
  static Future responseJoinToTeam(int accpted,int requestid,int teamid,int sender) async{
    final Response response = await post(
      Uri.parse(responseJoinToTeamUri),
      body: jsonEncode({
        "accipted":accpted,
        "requestid":requestid,
        "sender": sender,
        "teamid":teamid
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
      );
  }

  static String responsetochalingUri = "http://10.0.2.2:3000/team/responsetochaling";
  static Future responseToChaling(int resbonse,int senderteamleaderid, int senderteamid,int reciverteamleaderid, int reciverteamid,String startdate,int requestid)async{
    final Response response = await post(
      Uri.parse(responsetochalingUri),
      body: jsonEncode({
        "resbonse":resbonse,
        "senderteamleader": senderteamleaderid,
        "senderteamid": senderteamid,
        "reciverteamleaderid": reciverteamleaderid,
        "reciverteamid": reciverteamid,
        "startdate": startdate,
        "requestid":requestid
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      });
    print(response.body);
  }

}
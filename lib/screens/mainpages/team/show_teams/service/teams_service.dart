

import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';

class TeamsService{
  static final String teamsInfoUri = "http://10.0.2.2:3000/team/teaminformation";
  Future getTeamInformation(teamid)async{
    final Response response = await post(
      Uri.parse(teamsInfoUri),
      body: jsonEncode({
        "teamid":teamid
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
    );
    
    List responsebode = jsonDecode(response.body) as List ; 
    print(responsebode);
    return responsebode;
  }


  static final String teamMainInfoUri = "http://10.0.2.2:3000/team/teammaininfo";
  Future getTeamMainInformation(teamid)async{
    final Response response1 = await post(
      Uri.parse(teamMainInfoUri),
      body: jsonEncode({
        "teamid":teamid
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
    );
    
    List responsebode1 = jsonDecode(response1.body) as List ; 
    // print(responsebode1);
    return responsebode1;
  }

  static final String sendchalingUri = "http://10.0.2.2:3000/team/chalingingrequest";
  static Future sendChalingRequest(int senderteamleader,int senderteam,int reciverteamleader,int reciverteam,String detiles, date) async{
    print(date);
    final Response response = await post(
      Uri.parse(sendchalingUri),
      body: jsonEncode({
        "senderteamleader":senderteamleader,
        "senderteam":senderteam,
        "reciverteamleader":reciverteamleader,
        "reciverteam":reciverteam,
        "detiles":detiles,
        "date": date
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
    );
    print(response.body);
  }


  static final String getChalingsUri = "http://10.0.2.2:3000/team/getchalings";
  static Future getChalings() async{
    User user = UserPreferences.getUser();
    final Response response = await post(
      Uri.parse(getChalingsUri),
      body: jsonEncode({
        "teamleader":user.id
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
    );
    List responsebody = jsonDecode(response.body) as List;
    print(responsebody[2]['chaling_date']);
    DateTime now = DateTime.parse(responsebody[3]['chaling_date']);
    String isoDate = now.toIso8601String();
    // final formatter0 = DateFormat(now.toString());
    var dateFormatted = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime(responsebody[0]['chaling_date']));
    // print(DateTime.parse(responsebody[0]['chaling_date']));
    print(dateFormatted);
    return responsebody;
  }

}
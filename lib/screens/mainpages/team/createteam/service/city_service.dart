import 'dart:convert';
import 'package:http/http.dart';
import 'package:kora/screens/mainpages/team/createteam/module/area_module.dart';
import 'package:kora/screens/mainpages/team/createteam/module/city_module.dart';
import 'package:kora/screens/mainpages/team/createteam/module/team_type_number_module.dart';

class CityService{
  static final String getCitiesuri = 'http://10.0.2.2:3000/loctions/city';
  Future<List<Cities>> getCities() async{
    final Response response = await get(Uri.parse(getCitiesuri));
    var responsebode = jsonDecode(response.body) as List; 
    // print(responsebode);
      return responsebode.map((playerplace) => Cities.fromJson(playerplace)).toList();
  }

static final String getAreauri = 'http://10.0.2.2:3000/loctions/hoods';
  Future<List<Area>> getArea(cityid) async{
    
    final Response response = await post(
      Uri.parse(getAreauri),
      body: jsonEncode({'cityid':cityid}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
      );
    var responsebode = jsonDecode(response.body) as List; 
    print(responsebode);
      return responsebode.map((area) => Area.fromJson(area)).toList();
    
  }

  static final String getTeamTypeUri = 'http://10.0.2.2:3000/loctions/getteamtype';
  Future<List<TeamTypePlayersNumber>> getTeamType() async{
    
    final Response response = await get(Uri.parse(getTeamTypeUri));
    var responsebode = jsonDecode(response.body) as List; 
    print(responsebode);
      return responsebode.map((typeplayer) => TeamTypePlayersNumber.fromJson(typeplayer)).toList();
    
  }
}
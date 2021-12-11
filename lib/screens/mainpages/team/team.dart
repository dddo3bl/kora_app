

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kora/modules/service_users.dart';
import 'package:kora/modules/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/appbar.dart';
import 'package:kora/screens/mainpages/team/show_teams/chalingpage.dart';
import 'package:kora/screens/mainpages/team/show_teams/controllers/get_team_info_controller.dart';
import 'package:kora/screens/mainpages/team/show_teams/service/teams_service.dart';
import 'package:kora/screens/mainpages/team/show_teams/show_team_info.dart';
import 'package:provider/provider.dart';


class TeamPage extends StatefulWidget {
  const TeamPage({ Key? key }) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  User user = UserPreferences.getUser();
     tesstt()async{
     final ServiseUsers service = ServiseUsers();
     user = UserPreferences.getUser();    
  }
  // bool teamLeader = false;
  // List teamleader = [];
  Future isteamLeader()async{
    User user = UserPreferences.getUser();
    print(user.inteam);
    print(user.teamleader);
    print(user.team_id);
    // String isteamLeaderUri = "http://10.0.2.2:3000/users/isteamleader";
    // Response response = await post(Uri.parse(isteamLeaderUri),
    // body: jsonEncode({
    //   "userid":user.id
    // }),
    // headers: {
    //   'Content-type': 'application/json',
    //     'Accept': 'application/json'
    // }
    // );
    // List responsebody = jsonDecode(response.body) as List;
    // if(responsebody.isEmpty){
    //   setState(() {
    //     teamLeader = false;
        
    //   });
    // }else{
    //   setState(() {
    //     teamLeader = true;
    //     teamleader = responsebody;
    //   });
    // }
  }

  @override
  void initState() {
    tesstt();
    getCity();
    isteamLeader();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
                appBar: buldTeamAppBar(context, user.inteam),
                body: Center(
                  child: Container(
                    height: size.height,
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          height: size.height/4.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [ 
                                  cityWidget(size),
                                  SizedBox(height: 10,),
                                  areaWidget(size),
                                  SizedBox(height: 15,),
                                  Container(),
                                ],
                              ),
                        ),
                        Container(
                          height: size.height / 2,
                          child: Column(children: [
                            _myarea == null ?  
                            Text(" الرجاء اختيار المدينة والحي")
                                  :
                            FutureBuilder(
                              future: getNearTeams(),
                              builder:(BuildContext context, AsyncSnapshot snapshot){
                                if(snapshot.hasData){
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                    itemBuilder: (context,i){
                                    return Center(
                                      child: Container(
                                        height: 30,
                                        width: size.width / 1.1,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.transparent
                                        ),
                                        padding: EdgeInsets.only(left: size.width / 20),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  snapshot.data[i]['team_name'],
                                                  style: TextStyle(fontSize: 18),
                                                  ),
                                              onTap: ()async{
                                                Provider.of<GetTeamInfoController>(context,listen: false).onChang(snapshot.data[i]['team_id']);
                                                final list = await Provider.of<GetTeamInfoController>(context,listen: false).getteamMainInfo();
                                                Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (context) {
                                                return ShowTeamInformation(list: list,);
                                                }));
                                                },
                                              ),
                                              VerticalDivider(width: 20,thickness: 1.5,),
                                              user.inteam == false ? IconButton(
                                                padding: EdgeInsets.only(bottom: 10),
                                              onPressed: (){
                                                joinToTeam(snapshot.data[i]['team_leader_id'],snapshot.data[i]['team_id'],user.id, );
                                              }, 
                                              icon: Icon(
                                                Icons.person_add,
                                                size: 30,
                                                )
                                              ) : Text("ok"),
                                              VerticalDivider(width: 20,thickness: 1.5,),
                                              user.teamleader == true ? IconButton(
                                                onPressed: (){
                                                  
                                                  // print(user.id);
                                                  // TeamsService.sendChalingRequest(user.id, teamleader[0]['team_id'], snapshot.data[i]['team_leader_id'], teamleader[0]['team_id']);
                                                  Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (context) {
                                                return ChalingPage(
                                                  senderteamLeaderid: user.id, 
                                                  senderteamid: user.team_id!, 
                                                  reciverteamleaderid: snapshot.data[i]['team_leader_id'], 
                                                  reciverteamid: snapshot.data[i]['team_id'], 
                                                  reciverteamleadername: snapshot.data[i]['user_name'], 
                                                  reciverteamname: snapshot.data[i]['team_name']
                                                  );
                                                }));
                                                }, 
                                                icon: Icon(Icons.warning_amber)
                                                ):Text("")
                                            ],
                                          )
                                        
                                        ),
                                    ); 
                                });
                                }else{
                                  return Center(child: CircularProgressIndicator(),);
                                }
                                
                              }
                              ),
                              
                          ],),
                          ),
                          
                      ],
                    )
                    
              ),
                ),
              );
    
    }

// ====================================================== get area team
final String nearTeamUri = 'http://10.0.2.2:3000/team/getnearTeams';
Future getNearTeams()async{
  final Response response = await post(
    Uri.parse(nearTeamUri),
    body: jsonEncode({
      "areaid":_myarea
    }),
    headers: {
      'Content-type': 'application/json',
        'Accept': 'application/json'
    }
  );
  List responsbody = jsonDecode(response.body) as List;
  return responsbody;
}


// ====================================================== city widget
    final String getCitiesuri = 'http://10.0.2.2:3000/loctions/city';
    List? _cityList;
  String? _mycity;
  getCity() async{
    
    final Response response = await get(Uri.parse(getCitiesuri));
    if(response.statusCode == 200){
      var responsebode = jsonDecode(response.body) as List; 
    setState(() {
      _cityList = responsebode;
    });
    }else{
      _cityList = [];
    }
    
  }
  Widget cityWidget(Size size) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey.withOpacity(.3)),
        width: size.width / 1.2,
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  disabledColor: Colors.grey,
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    // focusColor: Colors.blueAccent,
                    dropdownColor: Colors.grey.withOpacity(.5),
                    value: _mycity,
                    iconSize: 30,
                    // icon: Icon(Icons.location_city_sharp),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    hint: Text("اختر المدينة"),
                    onChanged: (newValue) {
                      setState(() {
                        _mycity = newValue;
                        _myarea = null;
                      });
                      _getArea();
                    },
                    items: _cityList?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['city_name']),
                            value: item['city_id'].toString(),
                          );
                        }).toList() ??
                        [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


// ====================================================== area widget
  final String getAreauri = 'http://10.0.2.2:3000/loctions/hoods';
  List? _areaList;
  String? _myarea;
  Future _getArea() async{
    print(user.team_id ?? 'ok');
    final Response response = await post(
      Uri.parse(getAreauri),
      body: jsonEncode({'cityid':_mycity}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
      );
    var responsebode = jsonDecode(response.body) as List; 
    setState(() {
      _areaList = responsebode;
    });
  }

  Widget areaWidget(Size size) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueAccent.withOpacity(.3)),
        width: size.width / 1.2,
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  disabledColor: Colors.blueAccent,
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    focusColor: Colors.blueAccent,
                    dropdownColor: Colors.blueAccent,
                    value: _myarea,
                    iconSize: 30,
                    icon: (null),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    hint: Text("اختر الحي"),
                    onChanged: (newValue) {
                      setState(() {
                        _myarea = newValue;
                      });
                    },
                    items: _areaList?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['area_name']),
                            value: item['area_id'].toString(),
                          );
                        }).toList() ??
                        [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final String joInTeamUri = "http://10.0.2.2:3000/team/joinToTeam";
  Future joinToTeam(int teamLeaderId,int teamId, int playerId) async{
    final Response response = await post(
      Uri.parse(joInTeamUri),
      body: jsonEncode({
        "teamleaderid":teamLeaderId,
        "teamid":teamId,
        "playerid":playerId,
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      }
      );
    var responsbody = jsonDecode(response.body);
  }

}


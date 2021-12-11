

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/pages/personal_page.dart/whdgit/buttonwidget.dart';
import 'package:kora/screens/mainpages/team/createteam/module/area_module.dart';
import 'package:kora/screens/mainpages/team/createteam/module/city_module.dart';
import 'package:kora/screens/mainpages/team/createteam/service/cities_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/buldtext.dart';
import 'package:provider/provider.dart';
import 'module/team_type_number_module.dart';
import 'service/bulfarea_controller.dart';
import 'service/city_service.dart';
import 'service/teamtype_controller.dart';
import 'widget/buildcity.dart';
import 'widget/buildteamtype.dart';
import 'widget/buldarea.dart';

class JoinTeam extends StatelessWidget {

  String? teamName ;
  final CityService city = CityService();
  final CitiesControler cities = CitiesControler();

  @override
  
  Future creatTeam(area1,city1,teamtype1,BuildContext context) async{
    if(city1 != "null" || area1 != "null" || teamName != null || teamtype1 != null){
      final String creatTame = "http://10.0.2.2:3000/team/createteam";
      final User user = UserPreferences.getUser(); 
      final Response response = await post(Uri.parse(creatTame),
      body: jsonEncode({
        "team_leader_id":user.id,
        "teamname": teamName,
        "areaId": area1,
        "teamtypeid":teamtype1
      }),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      });
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        print(data['message']);
        print(data['teamid']);
        late User user ;
        user = UserPreferences.getUser();
        user = user.copy(
          inteam: true,
          teamleader: true,
          team_id: data['teamid']
        );
        UserPreferences.setUser(user);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Team has been created'),
          backgroundColor: Colors.black12,
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 5000),
          ));
        Navigator.pushReplacementNamed(context, 'mainpages');
        
      }
    }else{
      print("null");
    }

  }
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => city.getCities(), 
          initialData: <Cities>[]
          ),
        //   ChangeNotifierProvider<CitiesControler>(
        //   create: (context) => CitiesControler()
        //   ),
          FutureProvider(
          create: (context) => city.getArea(cities.chosen), 
          initialData: <Area>[]
          ),
        //   ChangeNotifierProvider<BuildAreaController>(
        //     create:(context)=>BuildAreaController() ,
        //   ),
        //   ChangeNotifierProvider<TeamTypeController>(
        //     create:(context)=>TeamTypeController() ,
        //   ),
          FutureProvider(
          create: (context) => city.getTeamType(), 
          initialData: <TeamTypePlayersNumber>[]
          ),
          
      ],
      
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor :Colors.white,
          foregroundColor: Colors.transparent,
          title: Text("Create Team"),
          leading: IconButton(onPressed: (){
            Provider.of<CitiesControler>(context,listen: false).onChang(null);
            Provider.of<TeamTypeController>(context,listen: false).onChang(null);
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          
          ),
          body: Center(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuldTextFeild(
                      label: "Team Name",
                      text: "Enter Team Name",
                      maxLines: 1,
                      onChing: (teamnae){
                        teamName = teamnae;
                      },
                      ),
                      SizedBox(height: 24,),
                      BuldCity(),
                      SizedBox(height: 24,),
                      BuldArea(),
                      BuldTeamType(),
                      Consumer<BuildAreaController>(
                        builder: (context,arra,child){
                          return ButtonWidget(
                        text: "hi", 
                        onClicked: (){
                          
                          creatTeam(arra.chosen == null ? "null" : arra.chosen.area_id,Provider.of<CitiesControler>(context,listen: false).chosen == null ? "null":Provider.of<CitiesControler>(context,listen: false).chosen.cityId,Provider.of<TeamTypeController>(context,listen: false).chosen.teamtypeplayers_id == null ? "null" : Provider.of<TeamTypeController>(context,listen: false).chosen.teamtypeplayers_id,context);
                          // print(jointeam.team_city);
                          Provider.of<BuildAreaController>(context,listen: false).onChang(null) ;
                          Provider.of<CitiesControler>(context,listen: false).onChang(null);
                          Provider.of<TeamTypeController>(context,listen: false).onChang(null);
                      }
                      );
                        },
                      ),
                  ],
                  ),
              ),
            ),
              ),
      ),
    );
  }
}
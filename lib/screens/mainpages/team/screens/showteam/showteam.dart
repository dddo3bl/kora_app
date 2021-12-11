


import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/module/showmyteaminfo_module.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/service/api_service.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/widget/my_team_players.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/widget/my_teaminfobox.dart';
import 'package:provider/provider.dart';

class ShowMyTeam extends StatelessWidget {
  // const ShowMyTeam({ Key? key }) : super(key: key);
  final MyTeamService myteaminfo = MyTeamService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
          create:(context) => myteaminfo.showMyTeamInfo(), 
          initialData: <ShowMyTeamInfo>[]
          )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Team"),
          centerTitle: true,
          backgroundColor :Colors.white,
            foregroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(
              children: [
              TeamInfoBox(),
              SizedBox(height: 20,),
              TeamPlayers()
              
            ],),
          ),
      ),
    );
  }
}
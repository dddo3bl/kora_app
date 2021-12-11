


import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/module/showmyteaminfo_module.dart';
import 'package:provider/provider.dart';

class TeamInfoBox extends StatelessWidget {

  String avalibalplayers(teamavalibal){

    return teamavalibal.toString();
  }

  @override
  Widget build(BuildContext context) {
      List<ShowMyTeamInfo> myinfo = Provider.of<List<ShowMyTeamInfo>>(context);
    Size size = MediaQuery.of(context).size;
    return myinfo.isEmpty == true ? Center(child: CircularProgressIndicator(),) : Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
        ),
        width: size.width,
        height: size.height / 5,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10,)),
                    
                    RichText(
                        textDirection: TextDirection.ltr,
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "team Name:   ",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: myinfo[0].team_name,style: TextStyle(color: Colors.lightBlue,fontSize: 18)),
                          ]
                        ),
                      ),
                    Padding(padding: EdgeInsets.only(top: 10,)),

                    RichText(
                        textDirection: TextDirection.ltr,
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Leader Name:   ",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: myinfo[0].team_leader,style: TextStyle(color: Colors.lightBlue,fontSize: 18)),
                          ]
                        ),
                      ),
                    Padding(padding: EdgeInsets.only(top: 10,)),
                    RichText(
                        textDirection: TextDirection.ltr,
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Team Id:   ",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: myinfo[0].team_id.toString(),style: TextStyle(color: Colors.lightBlue,fontSize: 18)),
                          ]
                        ),
                      ),
                                          Padding(padding: EdgeInsets.only(top: 10,)),

                      RichText(
                        textDirection: TextDirection.ltr,
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Numbers of players:   ",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: myinfo[0].team_type.toString(),style: TextStyle(color: Colors.lightBlue,fontSize: 18)),
                          ]
                        ),
                      ),
                  ],
                ),
                // =========================
                
                    
                  ],
                ),
                
              ],
            ),
            
          
        ),
      
    );
  }
}
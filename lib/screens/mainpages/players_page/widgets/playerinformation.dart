

import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/requests/controller/teamleadercontroller.dart';
import 'package:provider/provider.dart';

class PlayerInformation extends StatelessWidget {
  final List playerinfo;
  final int in_team;
  final String playerplace;
  const PlayerInformation({ Key? key,required this.playerinfo,required this.in_team, required this.playerplace }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(playerinfo);
    // Provider.of<TeamLeaderControllers>(context).getteamleader();
    // print(Provider.of<TeamLeaderControllers>(context,listen: false).teamLeader);
    return Scaffold(
      appBar: AppBar(title: Text("test"),),
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          // alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: size.height / 1.5,
            width: size.width,
            alignment: AlignmentDirectional.topCenter,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Player Name: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(playerinfo[0]['user_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Player Id: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(playerinfo[0]['user_id'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Age: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(playerinfo[0]['age'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Weight: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(playerinfo[0]['weight'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Hight: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(playerinfo[0]['hight'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("player place: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(playerplace,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Has Team: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(in_team == 1 ? "In Team" : "Not In Team",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),
                SizedBox(height: 20,),
                if (Provider.of<TeamLeaderControllers>(context,listen: false).teamLeader == true) in_team == 0 ? TextButton(onPressed: (){}, child: Text("Send A Join Request")): Text("Has A Team") else Text("")
              ],
            ),
          )),
      ),
    );
  }
}
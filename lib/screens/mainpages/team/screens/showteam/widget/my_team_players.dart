



import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/module/myteamplayers_moduel.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/service/api_service.dart';
import 'package:provider/provider.dart';

class TeamPlayers extends StatelessWidget {
  // const TeamPlayers({ Key? key }) : super(key: key);
  // final MyTeamService myteam = MyTeamPlayers();
  @override
  Widget build(BuildContext context) {
          // List<MyTeamPlayers> myteamPlayers = Provider.of<List<MyTeamPlayers>>(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Player_name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              buildDivider(),
              Text("place",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("time play",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("gools",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("red card",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("yallow_card",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
          ],),
          FutureBuilder(
            future: MyTeamService.myteamplayrs(),
            
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                
                return Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    
              Text(snapshot.data[i]['user_name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              buildDivider(),
              Text(snapshot.data[i]['playerPlace_name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("time play",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("gools",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("red card",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              buildDivider(),
              Text("yallow_card",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
          
                  ],
                );});
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
              
            },
          ),
        ],
      ),
    );
  }


  buildDivider() {
    return Container(
      height: 24,
      child: VerticalDivider(
        width: 10,
      ));
  }
}
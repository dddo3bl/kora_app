


import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/requests/service/rquestsapi.dart';
// import 'package:kora/screens/mainpages/requests/controller/getrequest.dart';
// import 'package:provider/provider.dart';

// ignore: must_be_immutable
class JoinRequests extends StatelessWidget {


  Color chalingColor = Colors.black;
  Color joinColor = Colors.brown;
  chingJoincolor(int join){
    if(join == 0){
      return Colors.red;
    }else{
      return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Provider.of<GetRequestsController>(context).testApi();
    return Container(
      child: Column(children: [
        FutureBuilder(
          future: RequestsApi.getRequests(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i){
                  return Container(
                    color: chingJoincolor(snapshot.data[i]['done']),
                    width: size.width,
                    height: 30,
                    child: Row(children: [
                      Text(snapshot.data[i]['user_name'] + ": " + "whant to join to your team"),
                      VerticalDivider(thickness: 2,),
                      snapshot.data[i]['done'] == 0 ?
                      Row(children: [
                        IconButton(
                        onPressed: (){
                          RequestsApi.responseJoinToTeam(1, snapshot.data[i]["join_to_team_id"],snapshot.data[i]["team_id"],snapshot.data[i]["send_from"]);
                          Navigator.of(context).pushReplacementNamed("mainpages");
                        },
                        icon: Icon(Icons.done)
                        ),
                        VerticalDivider(thickness: 2,),
                        IconButton(
                        onPressed: (){
                          RequestsApi.responseJoinToTeam(0, snapshot.data[i]["join_to_team_id"],0,0);
                          Navigator.of(context).pushReplacementNamed("mainpages");
                        },
                        icon: Icon(Icons.not_interested)
                        ),
                      ],): Text("تم")
                    ],),
                  );
                }
                );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
          )
      ],),
    );
  }
  
}
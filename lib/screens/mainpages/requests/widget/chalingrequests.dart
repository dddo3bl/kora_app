



import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/requests/widget/showchalings.dart';
import 'package:kora/screens/mainpages/team/show_teams/service/teams_service.dart';

class ChalingRequests extends StatelessWidget {
  const ChalingRequests({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(children: [

        SizedBox(height: 15,),
        FutureBuilder(
          future: TeamsService.getChalings(),
          builder: (BuildContext context , AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ShowChalings(
                      teamLeaderSenderid: snapshot.data[i]['team_leader_sender'],
                      teamLeaderName: snapshot.data[i]['user_name'],
                      teamName: snapshot.data[i]['team_name'],
                      teamSenderid: snapshot.data[i]['team_id_sender'],
                      detils: snapshot.data[i]['detiels'],
                      chaling_date: snapshot.data[i]['chaling_date'],
                      done: snapshot.data[i]['done'],
                      teamLeaderreciverid: snapshot.data[i]['team_leader_recive'],
                      teamreciverid: snapshot.data[i]['team_id_recive'],
                      requestid: snapshot.data[i]['request_id'],
                        );
                      }));
                    },
                    child: Card(
                      color: snapshot.data[i]['done'] == 0 ? Colors.blueAccent.withOpacity(.5) :Colors.blueGrey.withOpacity(.5),
                      child: Text(snapshot.data[i]['team_name'] + ": whants to chalinging your team",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
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

// ShowChalings(
//                     teamLeaderSenderid: snapshot.data[i]['team_leader_sender'],
//                     teamLeaderName: snapshot.data[i]['user_name'],
//                     teamName: snapshot.data[i]['team_name'],
//                     teamSenderid: snapshot.data[i]['team_id_sender'],
//                     detils: snapshot.data[i]['detiels'],
//                     startDate: snapshot.data[i]['startdate'],
//                     startTime: snapshot.data[i]['starttime'],
//                   );
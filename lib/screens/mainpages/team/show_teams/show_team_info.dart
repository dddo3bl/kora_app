

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/get_team_info_controller.dart';

class ShowTeamInformation extends StatelessWidget {
  final List list;
  const ShowTeamInformation({ Key? key,required this.list }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ok"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 25,),
              FutureBuilder(
                initialData: list,
                builder: (BuildContext context, AsyncSnapshot snapshot1){
                  if(snapshot1.hasData){
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot1.data.length,
                      itemBuilder: (context,i){
                        return Center(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Team Name: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text("Team Id: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    Text("Team Leader: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    Text("Team Type: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(snapshot1.data[i]['team_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                Text(snapshot1.data[i]['team_id'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                Text(snapshot1.data[i]['user_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                Text(snapshot1.data[i]['team_num_players'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

                              ],)
                              ],
                            ),
                          ),
                        );
                      }
                      );
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }
              ),
              SizedBox(height: 35,),
              Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text("Player Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text("place play",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text("gool",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ],),
                  
                ],),
              ),
                  
              
                
              
              SizedBox(height: 15,),
              FutureBuilder(
                future: Provider.of<GetTeamInfoController>(context).getciti(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,i)
                    {
                      return Card(
                        color: Colors.grey.withOpacity(.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(snapshot.data[i]['user_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              child: Text(snapshot.data[i]['playerPlace_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Text(snapshot.data[i]['score'] == null ? "0" : snapshot.data[i]['score'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      );
                  });
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              }
              ),
            ],
          ),
        ),
      );
    
  }
}


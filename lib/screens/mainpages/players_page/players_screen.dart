import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/players_page/service/getusersrequst.dart';
import 'package:kora/screens/mainpages/players_page/widgets/playerinformation.dart';
import 'package:kora/screens/mainpages/requests/controller/teamleadercontroller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/buildcity.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/buldarea.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('Players'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Text("اختر المدينة "),
              BuldCity(),
              Text("اختر الحي "),
              BuldArea(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Player Name',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  'Id',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  'Player Place',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  'In Team',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                ],
              ),
              // TextButton(onPressed: (){
              //   print(Provider.of<BuildAreaController>(context,listen: false).chosen);
              // }, child: Text("test"))
              SizedBox(height: 15,),
              Provider.of<BuildAreaController>(context).chosen == null ? Text("الرجاء اختيار المدينة والحي") : 
              FutureBuilder(
                future:GetAllUsers.getAllUsers(Provider.of<BuildAreaController>(context).chosen.area_id),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,i){
                        return InkWell(
                          onTap: ()async{
                            Provider.of<TeamLeaderControllers>(context,listen: false).getteamleader();
                            List responsbody =  await GetAllUsers.getinfofPlayer(snapshot.data[i]['user_id']);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return PlayerInformation(
                                playerinfo: responsbody,
                                in_team: snapshot.data[i]['in_team'],
                                playerplace: snapshot.data[i]['playerPlace_name'],
                              );
                            }));
                            // PlayerInformation
                          },
                          child: Card(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.data[i]['user_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  Text(snapshot.data[i]['user_id'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  Text(snapshot.data[i]['playerPlace_name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  snapshot.data[i]['in_team'] == 0 ? Text("not in team",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)): Text("in team",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                                  
                                ],
                              ),
                              ),
                          ),
                        );
                      }
                      );
                  }else{
                    return Center(child:CircularProgressIndicator());
                  }
              })
            ],
          
          ),
        ),
        
      ),
    );
  }
}

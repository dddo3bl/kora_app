import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/mainpages/requests/widget/chalingrequests.dart';
import 'package:kora/screens/mainpages/requests/widget/joinrequests.dart';
import 'package:provider/provider.dart';

import 'controller/teamleadercontroller.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var inn = 1;
  
  @override
  Widget build(BuildContext context) {
    Provider.of<TeamLeaderControllers>(context,listen: false).getteamleader();
    // print(Provider.of<TeamLeaderControllers>(context,listen: false).teamLeader);
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("User Request"),
          centerTitle: true,
        ),
        bottomNavigationBar: Provider.of<TeamLeaderControllers>(context).teamLeader == true ? BottomNavyBar(
          itemCornerRadius: 15,
          onItemSelected: (index){
            setState(() {
              inn = index;
            });
            print(inn);
          },
          selectedIndex: inn,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
        icon: Icon(FontAwesomeIcons.home),
        title: Text('Chaling Request'),
        textAlign: TextAlign.center,
        activeColor: Colors.green,
        
      ),
      BottomNavyBarItem(
        icon: Icon(FontAwesomeIcons.home),
        title: Text('Join Request'),
        textAlign: TextAlign.center,
        activeColor: Colors.green,
        
      ),
          ],
        ) : Text(""),
        body: buildpages(inn) ,
      ),
    );
  }
  Widget buildpages(index){
    switch (index) {
      case 0:
        return ChalingRequests();
      case 1:
      default:
        return JoinRequests();
    }
  }
}




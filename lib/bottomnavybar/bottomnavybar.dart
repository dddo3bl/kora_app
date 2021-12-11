import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kora/bottomnavybar/providers/navyprovider.dart';
import 'package:kora/pages/personal_page.dart/profile_page.dart';
import 'package:kora/screens/mainpages/players_page/players_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:kora/screens/mainpages/requests/controller/teamleadercontroller.dart';
import 'package:kora/screens/mainpages/team/team.dart';
import 'package:kora/screens/mainpages/requests/user.dart';
import 'package:provider/provider.dart';

class MainPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PageIndex(),
      child: Scaffold(
        body:Consumer<PageIndex>(builder: (context,pageindex,child){
          return bulidPages(pageindex.indexpage);
        },),
        bottomNavigationBar: Consumer<PageIndex>(builder: (context, pageindex, child){
          final inactivecolor = Colors.grey;
          return buildBottomNavigation(pageindex, inactivecolor);
        },),
      ),
    );
  }

  BottomNavyBar buildBottomNavigation(PageIndex pageindex, MaterialColor inactivecolor) {
    return BottomNavyBar(
          
    itemCornerRadius: 15,
    backgroundColor: Colors.black,
    containerHeight: 65,
    selectedIndex: pageindex.indexpage,
    onItemSelected: (index){
      pageindex.changIndex1(index);
      },
    items: <BottomNavyBarItem>[
      BottomNavyBarItem(
        icon: Icon(FontAwesomeIcons.home),
        title: Text('home'),
        textAlign: TextAlign.center,
        activeColor: Colors.green,
        inactiveColor: inactivecolor,
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.people),
        title: Text('user'),
        textAlign: TextAlign.center,
        activeColor: Colors.green,
        inactiveColor: inactivecolor,
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.message_outlined),
        title: Text('messages'),
        textAlign: TextAlign.center,
        activeColor: Colors.green,
        inactiveColor: inactivecolor,
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.person),
        title: Text('personal Info'),
        textAlign: TextAlign.center,
        activeColor: Colors.green,
        inactiveColor: inactivecolor,
      ),
    ],
  );
  }

  Widget bulidPages(index) {
    switch (index) {
      case 1:
        return TeamPage();
      case 2:

        return UserPage();
      case 3:
        return ProfilePage();
      case 0:
      default:
        return HomePage();
    }
  }
}

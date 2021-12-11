

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/mainpages/team/createteam/createteam.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/cities_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/buildcity.dart';
import 'package:kora/screens/mainpages/team/screens/showteam/showteam.dart';
import 'package:provider/provider.dart';

AppBar buldTeamAppBar(BuildContext context, users){
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.black.withOpacity(0.1),
    foregroundColor: Colors.transparent,
    leading: null,
    title: Text("Team"),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: (){}, 
        icon: Icon(Icons.search)
        ),

        users == false ? IconButton(onPressed: (){
          Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return JoinTeam();
                            }));
          Provider.of<BuildAreaController>(context,listen: false).onChang(null) ;
                          Provider.of<CitiesControler>(context,listen: false).onChang(null);
            }, 
            icon: Icon(Icons.flag_outlined) 
        ) : 
        IconButton(onPressed: (){
          Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ShowMyTeam();
                            }));
            }, 
            icon: Icon(Icons.flag) 
        ),
        
            
    ],
  );
}


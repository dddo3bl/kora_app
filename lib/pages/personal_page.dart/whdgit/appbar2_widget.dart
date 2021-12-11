import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/cities_controller.dart';
import 'package:provider/provider.dart';



AppBar buildAppBar2(BuildContext context){
  final icon = CupertinoIcons.moon_stars;

  

  return AppBar(
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
        Provider.of<BuildAreaController>(context,listen: false).onChang(null) ;
        Provider.of<CitiesControler>(context,listen: false).onChang(null);
      },
      icon: Icon(Icons.arrow_back)
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(onPressed: (){}, 
      icon: Icon(icon)
      )
    ],
  );
}
import 'package:flutter/material.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/pages/personal_page.dart/whdgit/appbar_widget.dart';
import 'package:kora/pages/personal_page.dart/whdgit/buttonwidget.dart';
import 'package:kora/pages/personal_page.dart/whdgit/numberswidget.dart';
import 'package:kora/pages/personal_page.dart/whdgit/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user ;
  void initState() {
    user = UserPreferences.getUser();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(user.email);
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            nClicked: ()async{
              await Navigator.of(context).pushNamed("editprofilepage");
              
            },
          ),
          const SizedBox(height: 24),
          buildname(user),
          const SizedBox(height: 24,),
          Center(child: buildUpgradeButton(),) ,
          const SizedBox(height: 24,),
          NumbersWidget(age: user.age,id: user.id,weight: user.weight, hight: user.hight,),
          const SizedBox(height: 48,),
          Center(child: buildAbout(user),) 
          
        ],
        ),
    );
  }

  buildname(User user) {
    return Column(children: [
      Text(user.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      const SizedBox(height: 4,),
      Text(user.email,style: TextStyle(color: Colors.grey),)
    ],);
  }

  buildUpgradeButton() {
    return ButtonWidget(
      text:"upgrade To PRO",
      onClicked:(){},
    );
  }

  buildAbout(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        const SizedBox(height: 16,),
        Text(user.about,style: TextStyle(fontSize: 16,height: 1.4),),
      ],
    );
  }
}
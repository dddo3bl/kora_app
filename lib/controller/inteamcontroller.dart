
import 'package:flutter/cupertino.dart';
import 'package:kora/modules/service_users.dart';
import 'package:kora/modules/user_module.dart';


class InTeamController extends ChangeNotifier{

  bool inteam = false;
  List<Users> user = []  ;
  ServiseUsers usss = ServiseUsers() ;

  getUser()async{
    user = await usss.getPersonalInfo();
    print(user);
  }
}
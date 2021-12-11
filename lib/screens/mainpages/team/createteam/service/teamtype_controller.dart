// @dart=2.9

import 'package:flutter/foundation.dart';
import 'package:kora/screens/mainpages/team/createteam/module/team_type_number_module.dart';

class TeamTypeController extends ChangeNotifier{
  TeamTypePlayersNumber _chosen ;
  TeamTypePlayersNumber get chosen => _chosen ;

  onChang(TeamTypePlayersNumber citiId){
    _chosen = citiId;
    notifyListeners();
  }
  

}
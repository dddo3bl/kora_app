

import 'package:flutter/cupertino.dart';
import 'package:kora/screens/mainpages/team/show_teams/service/teams_service.dart';

class GetTeamInfoController extends ChangeNotifier{

  int _chosen = 0;
  int get chosen => _chosen;
  List rsponse = [];
  List mainInfo = [];
  TeamsService teamService = TeamsService();
  onChang(teamid){
    _chosen = teamid;
    notifyListeners();
  }

  Future getciti()async{
    rsponse = await teamService.getTeamInformation(_chosen);
    // print(rsponse[0]['message']);
    // notifyListeners();
    return rsponse;
  }
  
  Future getteamMainInfo()async{
    mainInfo = await teamService.getTeamMainInformation(_chosen);
    // print(rsponse[0]['message']);
    // notifyListeners();
    return mainInfo;
  }

}
// @dart=2.9

import 'package:flutter/foundation.dart';
import 'package:kora/screens/mainpages/team/createteam/module/city_module.dart';

class CitiesControler extends ChangeNotifier{
  Cities _chosen ;
  Cities get chosen => _chosen ;

  onChang(Cities citiId){
    _chosen = citiId;
    notifyListeners();
  }
  

}
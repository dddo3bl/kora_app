
// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:kora/screens/mainpages/team/createteam/module/area_module.dart';
import 'cities_controller.dart';
import 'city_service.dart';

class BuildAreaController extends ChangeNotifier{

  Area _chosen;
  Area get chosen => _chosen ;  
  List<Area>  areaList = [];
  CityService servise = CityService();
  CitiesControler cites = CitiesControler();
  getciti(int cityid)async{
    areaList = await servise.getArea(cityid);
    print(areaList[0].area_name);
    notifyListeners();
  }
onChang(citiId){
    _chosen = citiId;
    // areaList = [];
    notifyListeners();
  }
}
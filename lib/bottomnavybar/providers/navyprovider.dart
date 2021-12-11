import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/requests/controller/teamleadercontroller.dart';


class PageIndex extends ChangeNotifier{
  int indexpage = 0;

  
  changIndex1(int indext){
    indexpage = indext;
    notifyListeners();
  }


}
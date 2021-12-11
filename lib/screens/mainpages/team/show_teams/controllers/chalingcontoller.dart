

import 'package:flutter/cupertino.dart';

class ChalingController extends ChangeNotifier{

  // String _startdate = "Not set";
  // String get startdate => _startdate;
  // String _starttime = "Not set";
  // String get starttime => _starttime;
   
  // onChangStartDate(startDate){
  //   _startdate = startDate;
  //   notifyListeners();
  // }

  // onChangStartTime(startTime){
  //   _starttime = startTime;
  //   notifyListeners();
  // }

  TextEditingController dateChaling = TextEditingController();

  onChaingdate(TextEditingController start){
    dateChaling = start;
    print(start.text);
    notifyListeners();
  }

}
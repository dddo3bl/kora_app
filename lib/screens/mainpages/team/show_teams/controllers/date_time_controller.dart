
import 'package:flutter/cupertino.dart';

class DateTimeController extends ChangeNotifier{

  DateTime _date = DateTime.now();
  DateTime get date => _date;
  onChingDate(DateTime date){
    _date = date;
    notifyListeners();
  }

}


import 'package:flutter/cupertino.dart';
import 'package:kora/screens/mainpages/requests/service/rquestsapi.dart';

class GetRequestsController extends ChangeNotifier{

  String userEmail = "" ;

   testApi()async{
    userEmail = await RequestsApi.getRequests();
    print(userEmail);
    // notifyListeners();
  }
}
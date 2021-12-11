// @dart=2.9



import 'package:flutter/foundation.dart';
import 'package:kora/modules/playerplace_moduel.dart';


class PlayerPlaceControler extends ChangeNotifier{
  PlayerPlace _chosen ;
  PlayerPlace get chosen => _chosen;
  PlayerPlace chh;

  onChang(PlayerPlace playerPlace){
    _chosen = playerPlace;
    chh = playerPlace;
    notifyListeners();
  }

}
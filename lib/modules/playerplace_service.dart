import 'dart:convert';

import 'package:http/http.dart';

import 'playerplace_moduel.dart';

class PlayerPlaceSevice{

  static final String getplayerplaceuri = 'http://10.0.2.2:3000/users/playerplace';
  Future<List<PlayerPlace>> getplayerplace() async{
    final Response response = await get(Uri.parse(getplayerplaceuri));
    var responsebode = jsonDecode(response.body) as List; 
    print(responsebode);
      return responsebode.map((playerplace) => PlayerPlace.fromJson(playerplace)).toList();
  }
}
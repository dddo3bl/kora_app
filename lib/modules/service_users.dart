import 'dart:convert';
import 'package:http/http.dart';
import 'package:kora/modules/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';

class ServiseUsers{
  User user = UserPreferences.getUser();
  static final String PersonalinfoUri = 'http://10.0.2.2:3000/users/getinteam';
    Future<List<Users>> getPersonalInfo() async{
     print(user.id);
    final Response response = await post(Uri.parse(PersonalinfoUri),
    body: jsonEncode({
      "id":user.id
    }),
    headers: {
      'Content-type': 'application/json',
        'Accept': 'application/json'
    }
    );
    var responsebode = jsonDecode(response.body) as List; 
    return responsebode.map((users) => Users.fromJson(users)).toList();
  }

  

}
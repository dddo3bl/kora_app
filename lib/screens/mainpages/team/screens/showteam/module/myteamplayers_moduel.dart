

class MyTeamPlayers{
  final String player_name;
  final String player_postion;

  MyTeamPlayers({required this.player_name,required this.player_postion});

  static MyTeamPlayers fromJson(Map<String,dynamic> json) => MyTeamPlayers(
    player_name: json['user_name'],
    player_postion: json['playerPlace_name'],
    
  );
  
}
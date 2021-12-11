

class TeamTypePlayersNumber{
  final int teamtypeplayers_id;
  final int teamtypeplayers_numbers;

  TeamTypePlayersNumber({required this.teamtypeplayers_id,required this.teamtypeplayers_numbers});

  static TeamTypePlayersNumber fromJson(Map<String,dynamic> json) => TeamTypePlayersNumber(
    teamtypeplayers_id: json['team_num_players_id'],
    teamtypeplayers_numbers: json['team_num_players'],
  );

}
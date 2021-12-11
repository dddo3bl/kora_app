
class ShowMyTeamInfo{
  final int team_id;
  final String team_name;
  final String team_leader;
  final int team_type;

  ShowMyTeamInfo({required this.team_id,required this.team_name,required this.team_leader,required this.team_type});

  static ShowMyTeamInfo fromJson(Map<String,dynamic> json) => ShowMyTeamInfo(
    team_id: json['team_id'],
    team_name: json['team_name'],
    team_leader: json['user_name'],
    team_type: json['team_type'],
  );

}
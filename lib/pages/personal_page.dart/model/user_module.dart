class User{
  final int id;
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;
  final int playerPlace;
  final int age;
  final num weight;
  final num hight;
  final bool inteam;
  final int? team_id;
  final bool teamleader;

  const User({required this.id,required this.imagePath,required this.name,required this.email,required this.about,required this.isDarkMode, required this.playerPlace,required this.age, required this.weight, required this.hight,required this.inteam,required this.team_id, required this.teamleader});

  User copy({
    int? id,
    String? imagePath,
    String? name,
    String? email,
    String? password,
    String? about,
    bool? isDarkMode,
    int? playerPlace,
    int? age,
    num? weight,
    num? hight,
    bool? inteam,
    int? team_id,
    bool? teamleader
  }) => User(
    id: id ?? this.id,
    imagePath: imagePath ?? this.imagePath,
    name: name ?? this.name,
    email: email ?? this.email,
    about: about ?? this.about,
    isDarkMode: isDarkMode ?? this.isDarkMode,
    playerPlace: playerPlace ?? this.playerPlace,
    age: age ?? this.age,
    weight: weight ?? this.weight,
    hight: hight ?? this.hight,
    inteam: inteam ?? this.inteam,
    team_id: team_id ?? this.team_id,
    teamleader: teamleader ?? this.teamleader
  );

  Map<String, dynamic> toJson() => {
    'id':id,
    'imagePath':imagePath,
    'name':name,
    'email':email,
    'about':about,
    'isDarkMode':isDarkMode,
    'playerPlace':playerPlace,
    'age':age,
    'weight':weight,
    'hight':hight,
    'in_team':inteam,
    'team_id':team_id,
    'teamleader':teamleader
  };

  static User fromJson(Map<String,dynamic> json) => User(
    id: json['id'],
    imagePath: json['imagePath'],
    name: json['name'],
    email: json['email'],
    about:json['about'],
    isDarkMode:json['isDarkMode'],
    playerPlace:json['playerPlace'],
    age: json['age'],
    weight: json['weight'],
    hight: json['hight'],
    inteam: json['in_team'],
    team_id: json['team_id'],
    teamleader: json['teamleader']
  );

  

}
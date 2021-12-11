
class Users{
  final int id;
  final String name;
  final String email;
  final int playerPlace;
  final int inTeam;
  final int phone;
  final int age;
  final num hight;
  final num weight;



  Users({required this.id, required this.name,required this.email ,required this.playerPlace, required this.inTeam, required this.phone, required this.age, required this.hight,required this.weight});

  

  static Users fromJson(Map<String,dynamic> json) => Users(
    id: json['user_ids'],
    name: json['user_name'],
    email: json['email'],
    playerPlace:json['playerPlace'],
    inTeam: json['in_team'],
    phone: json['phone'],
    age: json['age'],
    hight: json['hight'],
    weight: json['weight'],
    
  );

  }
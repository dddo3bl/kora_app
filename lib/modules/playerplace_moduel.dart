

class PlayerPlace{
  final int id;
  final String name;


  PlayerPlace({required this.id, required this.name});

  
  
static PlayerPlace fromJson(Map<String,dynamic> json) => PlayerPlace(
    id: json['playerplace_id'],
    name: json['playerPlace_name'],
  );

}


class Area{
  final int area_id;
  final String area_name;

  Area({required this.area_id,required this.area_name});

  static Area fromJson(Map<String,dynamic> json) => Area(
    area_id: json['area_id'],
    area_name: json['area_name'],
  );
  
}
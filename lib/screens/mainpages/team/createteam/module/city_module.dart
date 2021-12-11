
class Cities{
  final int cityId;
  final String cityName;

  Cities({required this.cityId,required this.cityName});

  static Cities fromJson(Map<String,dynamic> json) => Cities(
    cityId: json['city_id'],
    cityName: json['city_name'],
  );
}
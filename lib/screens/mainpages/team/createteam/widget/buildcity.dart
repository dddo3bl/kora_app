

import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/team/createteam/module/city_module.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/cities_controller.dart';
import 'package:provider/provider.dart';
class BuldCity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
      List<Cities> cities = Provider.of<List<Cities>>(context);
    return Consumer<CitiesControler>(
      builder: (context, cityId,child){
        return DropdownButton<Cities>(
          isExpanded: true,
          style: TextStyle(color: Colors.black),
          onChanged: (newSity){
            Provider.of<BuildAreaController>(context,listen: false).onChang(null) ;
            cityId.onChang(newSity);
            Provider.of<BuildAreaController>(context,listen: false).getciti(cityId.chosen.cityId);
          },
          dropdownColor: Colors.blueGrey,
          value: cityId.chosen,
          items: cities.map<DropdownMenuItem<Cities>>((item) => 
          DropdownMenuItem<Cities>(
            value: item,
            child: Text(item.cityName),
          ),
          ).toList(),
        );
      },
      
    );
  }
}
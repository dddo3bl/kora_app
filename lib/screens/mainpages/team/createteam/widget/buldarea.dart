


import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/team/createteam/module/area_module.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/city_service.dart';
import 'package:provider/provider.dart';

class BuldArea extends StatelessWidget {
final CityService city = CityService();
  @override
  Widget build(BuildContext context) {
    return Consumer<BuildAreaController>(
      builder: (context, area, child){
        return DropdownButton<Area>(
          isExpanded: true,
          style: TextStyle(color: Colors.black),
          onChanged: (newSityarea){
            area.onChang( newSityarea );
            // print(area.chosen.area_id);
          },
          value: area.chosen,
          items:Provider.of<BuildAreaController>(context).areaList.map<DropdownMenuItem<Area>>((e) => 
          DropdownMenuItem<Area>(
            value: e,
            child: Text(e.area_name),
          )
          ).toList(),

          );
      },
    );
  }
}
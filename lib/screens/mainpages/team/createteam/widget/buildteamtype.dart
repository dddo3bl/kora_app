

import 'package:flutter/material.dart';
import 'package:kora/screens/mainpages/team/createteam/module/team_type_number_module.dart';
import 'package:kora/screens/mainpages/team/createteam/service/teamtype_controller.dart';
import 'package:provider/provider.dart';
class BuldTeamType extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
      List<TeamTypePlayersNumber> teamtype = Provider.of<List<TeamTypePlayersNumber>>(context);
    return Consumer<TeamTypeController>(
      builder: (context, cityId,child){
        return DropdownButton<TeamTypePlayersNumber>(
          isExpanded: true,
          style: TextStyle(color: Colors.black),
          onChanged: (newSity){
            cityId.onChang(newSity);
          },
          dropdownColor: Colors.blueGrey,
          value: cityId.chosen,
          items: teamtype.map<DropdownMenuItem<TeamTypePlayersNumber>>((item) => 
          DropdownMenuItem<TeamTypePlayersNumber>(
            value: item,
            child: Text(item.teamtypeplayers_numbers.toString()),
          ),
          ).toList(),
        );
      },
      
    );
  }
}
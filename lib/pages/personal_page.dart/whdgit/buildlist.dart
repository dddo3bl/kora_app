

import 'package:flutter/material.dart';
import 'package:kora/controller/playerplace_controler.dart';
import 'package:kora/modules/playerplace_moduel.dart';
import 'package:provider/provider.dart';

class BuldList extends StatelessWidget {
  const BuldList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlayerPlace> playerplace = Provider.of<List<PlayerPlace>>(context);
    return Consumer<PlayerPlaceControler>(
      builder: (context, place, child){
        return DropdownButton<PlayerPlace>(
          isExpanded: true,
          style: TextStyle(color: Colors.black),
          onChanged: (newPlace) => place.onChang(newPlace),
          dropdownColor: Colors.blueGrey,
          value: place.chosen,
          items: playerplace.map<DropdownMenuItem<PlayerPlace>>((value) => 
          DropdownMenuItem<PlayerPlace>(
            value: value,
            child: Text(value.name),
          ),
          ).toList()
          );
      },
    );
  }
}
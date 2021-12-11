import 'package:flutter/material.dart';


class NumbersWidget extends StatelessWidget {
  final int age;
  final int id;
  final num hight;
  final num weight;
  const NumbersWidget({ Key? key,required this.age ,required this.id, required this.hight, required this.weight}) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buldButton(context, age.toString(),'age'),
          buildDivider(),
          buldButton(context, id.toString(),'id'),
          buildDivider(),
          buldButton(context, weight.toString(),'weight'),
          buildDivider(),
          buldButton(context, hight.toString(),'hight'),
        ],
      ),
    );
  }

  buldButton(BuildContext context, String value, String text) {
    return MaterialButton(
      onPressed: (){},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(value,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 2,),
          Text(text,style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  buildDivider() {
    return Container(
      height: 24,
      child: VerticalDivider());
  }
}
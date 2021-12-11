

import 'package:flutter/material.dart';

class BuldTextFeild extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChing;
  final int maxLines;
  const BuldTextFeild({ Key? key,required this.label,required this.text,required this.onChing,required this.maxLines }) : super(key: key);

  @override
  _BuldTextFeildState createState() => _BuldTextFeildState();
}

class _BuldTextFeildState extends State<BuldTextFeild> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [    
        Text(widget.label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),   
          SizedBox(height: 8,),
           Container(
             width: size.width /1.1,
             child: TextField(
               onChanged: widget.onChing,
               maxLines: widget.maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
               controller: controller,
          ),
           ),
        
      ],
    );
  }
}
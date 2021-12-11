
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChing;
  final int maxLines;
  final TextInputType typeof;
  const TextFieldWidget({ Key? key,required this.label,required this.text,required this.onChing, this.maxLines = 1, required this.typeof }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 8,),
        TextField(
          onChanged: widget.onChing,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          controller: controller,
          keyboardType: widget.typeof,
        ),
      ],
    );
  }
}
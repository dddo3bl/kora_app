
import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback nClicked;
  final bool isEdit; 

  const ProfileWidget({Key? key,required this.imagePath,required this.nClicked, this.isEdit = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buldImage(),
          Positioned(
            child: buldEditIcon(color),
            bottom: 0,
            right: 4,
            )
          
        ],
      ),
    );
  }
  Widget buldImage(){
    final image = imagePath.contains('https://') ? NetworkImage(imagePath) : FileImage(File(imagePath));
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
        fit:BoxFit.cover ,
        width: 128,
        height: 128,
        child: InkWell(onTap: nClicked,),
        ),
      ),
    );
  }

  buldEditIcon(Color color) {
    return buldCircle(
      color: Colors.white,
      all: 3,
      child: buldCircle(
        color: color,
        all: 8,
        child: Icon(
          isEdit ? Icons.add_a_photo : Icons.edit,
        size: 20,
        color: Colors.white,
        ),
      ),
    );
  }

  Widget buldCircle({
    required Widget child,
    required double all,
    required Color color,
  }) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
  );
}
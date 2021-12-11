

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/pages/personal_page.dart/whdgit/buttonwidget.dart';
import 'package:kora/screens/mainpages/requests/service/rquestsapi.dart';

class ShowChalings extends StatelessWidget {
  final int teamLeaderSenderid;
  final int teamSenderid;
  final String chaling_date;
  final String detils;
  final String teamLeaderName;
  final String teamName;
  final int done;
  final int teamLeaderreciverid;
  final int teamreciverid;
  final int requestid;

  const ShowChalings({ Key? key,required this.teamLeaderSenderid,required this.teamSenderid,required this.chaling_date,required this.detils,required this.teamLeaderName,required this.teamName,required this.done,required this.teamLeaderreciverid, required this.teamreciverid,required this.requestid }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.white,
           foregroundColor: Colors.white,
           centerTitle: true,
           title: Text("Chaling Message"),
         ),
         body: Center(
           child: Container(
             alignment: AlignmentDirectional.topCenter,
             height:size.height / 1.3 ,
             width: size.width,
             child: Column(children: [
               Container(
                
                 child: Text("Team: $teamName Whant to chaling you")
               ),
               Padding(padding: EdgeInsets.only(bottom: 20)),
               Text(detils),
               Padding(padding: EdgeInsets.only(bottom: 20)),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Text("Day: "),
                 Text(chaling_date)
               ],),
               Padding(padding: EdgeInsets.only(bottom: 20)),
               
               Padding(padding: EdgeInsets.only(bottom: 40)),
               done == 0 ? Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 ElevatedButton(
                 style: ElevatedButton.styleFrom(
                 onPrimary: Colors.white,
                 shape: StadiumBorder(
                  ),
               padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12)
                  ),
                 onPressed: (){
                   RequestsApi.responseToChaling(1, teamLeaderSenderid, teamSenderid, teamLeaderreciverid, teamreciverid, chaling_date, requestid);
                   Navigator.pushReplacementNamed(context, 'mainpages');
                 },
                 child: Text("ok"),
    ),
    // ===========================================================================
               Padding(padding: EdgeInsets.only(left: 40)),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                 onPrimary: Colors.white,
                 shape: StadiumBorder(
                 ),
                 padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12)
                 ),
                 onPressed: (){
                   RequestsApi.responseToChaling(0, teamLeaderSenderid, teamSenderid, teamLeaderreciverid, teamreciverid, chaling_date,requestid);
                   Navigator.pushReplacementNamed(context, 'mainpages');
                 },
                 child: Text("not"),
                ),
                ],) : Text("done")
               

             ],),
           ),
         ),
    );
  }
}
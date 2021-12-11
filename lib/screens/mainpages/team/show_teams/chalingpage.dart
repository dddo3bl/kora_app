


import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/pages/personal_page.dart/whdgit/buttonwidget.dart';
import 'package:kora/screens/mainpages/team/show_teams/service/teams_service.dart';
import 'package:provider/provider.dart';

import 'controllers/date_time_controller.dart';


class ChalingPage extends StatelessWidget {
  final int senderteamLeaderid;
  final int senderteamid;
  final int reciverteamleaderid;
  final int reciverteamid;
  final String reciverteamleadername;
  final String reciverteamname;
  ChalingPage({ Key? key,required this.senderteamLeaderid,required this.senderteamid,required this.reciverteamleaderid,required this.reciverteamid,required this.reciverteamleadername,required this.reciverteamname }) : super(key: key);
  TextEditingController startDate = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController details = TextEditingController();
  // DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var dateProv = Provider.of<DateTimeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chalinging Forma"),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(.8),
      ),
      body: SingleChildScrollView(
          child: Column(
            // alignment: AlignmentDirectional.topStart,
            children: [
              SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Chalinging Team:",style: TextStyle(fontSize: 18),),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(reciverteamname,style: TextStyle(fontSize: 18)),
            ],),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Team Id:",style: TextStyle(fontSize: 18),),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(reciverteamid.toString(),style: TextStyle(fontSize: 18)),
            ],),
        
            // StartDateTime()
            Text("اختر اليوم",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ButtonWidget(
              text: 'Choose the date',
              onClicked: () => showShet(
                context, 
                child: buildDataPicker(context), 
                onClicked: (){
                  final value = formatDate(dateProv.date, [yyyy, '-', m, '-', d]);
                  showSnackBar(context, 'Selected $value');
                  Navigator.pop(context);
                }
                )
            ),

            SizedBox(height: 10,),
            Text("اختر الزمن",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            
            ButtonWidget(
              text: 'Choose the time',
              onClicked: () => showShet(
                context, 
                child: buildTimePicker(context), 
                onClicked: (){
                  final value = formatDate(dateProv.date, [yyyy, '-', m, '-', d, ' ', h, ':' , nn, ':', ss, ' ', n]);
                  showSnackBar(context, 'Selected $value');
                  Navigator.pop(context);
                }
                )
            ),
            SizedBox(height: 10,),

            Text('${formatDate(dateProv.date,[yyyy, '-', m, '-', d, ' ', h, ':' , nn, ':', ss, ' ', am])}',style: TextStyle(fontSize: 24),),
            SizedBox(height: 10,),
            Text("ادخل تفاصيل اكتر مثل رقم الهاتف ومكان المبارة ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              controller: details,
              textInputAction: TextInputAction.done
            ),
            TextButton.icon(
              onPressed: (){
                TeamsService.sendChalingRequest(senderteamLeaderid, senderteamid, reciverteamleaderid, reciverteamid,details.text, formatDate(dateProv.date, [yyyy, '-', m, '-', d, ' ', h, ':' , nn, ':', ss, ' ', am]) );
                Navigator.pop(context);
              },
              icon: Icon(Icons.not_interested), 
              label: Text("ok")),
        
          ],),
        ),
      
    );
  }

  Widget buildDataPicker(BuildContext context) => SizedBox(
    height: 180,
    child: CupertinoDatePicker(
      use24hFormat: true,
      backgroundColor: Colors.black38,
      minimumYear: 2020,
      maximumYear: DateTime.now().year,
      initialDateTime: Provider.of<DateTimeController>(context,listen: false).date,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime){
        Provider.of<DateTimeController>(context,listen: false).onChingDate(dateTime);
      },
  
    ),
  );

  void showShet(BuildContext context,{
    required Widget child,
    required VoidCallback onClicked,
  }) => showCupertinoModalPopup(
    context: context, builder: (context)=> CupertinoActionSheet(
      actions: [
        child,
      ],
      cancelButton:  CupertinoActionSheetAction(onPressed: onClicked, child:Text('Done')),
    )
    );

    void showSnackBar(BuildContext context, String text){
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 5000),
        content: Text(text, style: TextStyle(fontSize: 24),),
        );
        ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()..showSnackBar(snackBar); 
    }

    // time
    Widget buildTimePicker(BuildContext context) => SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        use24hFormat: true,
        initialDateTime: Provider.of<DateTimeController>(context,listen: false).date,
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (dateTime){
          Provider.of<DateTimeController>(context,listen: false).onChingDate(dateTime);
        },
      ),
    );
}


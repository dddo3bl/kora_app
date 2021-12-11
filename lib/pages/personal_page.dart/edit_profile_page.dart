
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kora/controller/playerplace_controler.dart';
import 'package:kora/modules/playerplace_moduel.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/pages/personal_page.dart/whdgit/appbar2_widget.dart';
import 'package:kora/pages/personal_page.dart/whdgit/appbar_widget.dart';
import 'package:kora/pages/personal_page.dart/whdgit/buildlist.dart';
import 'package:kora/pages/personal_page.dart/whdgit/buttonwidget.dart';
import 'package:kora/pages/personal_page.dart/whdgit/profile_widget.dart';
import 'package:kora/screens/mainpages/team/createteam/module/city_module.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/cities_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/buildcity.dart';
import 'package:kora/screens/mainpages/team/createteam/widget/buldarea.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'model/user_module.dart';
import 'model/userapi.dart';
import 'whdgit/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({ Key? key }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user ;
  
  TextEditingController ttt = TextEditingController();
  @override
  void initState() {
    user = UserPreferences.getUser();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Cities> cities = Provider.of<List<Cities>>(context);
    List<PlayerPlace> playerplace = Provider.of<List<PlayerPlace>>(context);
    return Scaffold(
      appBar: buildAppBar2(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
           nClicked: () async{
             final image = await ImagePicker().getImage(source: ImageSource.gallery);
             if(image == null) return;
             final directroy = await getApplicationDocumentsDirectory();
             final name = basename(image.path);
             final imageFile = File('${directroy.path}/$name');
             final newImage = await File(image.path).copy(imageFile.path);
             setState(() {
               user = user.copy(imagePath: newImage.path);
             });
           },
           isEdit: true,
           ),
          TextFieldWidget(
            label:'Full Name',
            text: user.name,
            onChing:(name){
              user = user.copy(name:name);
              },
              typeof: TextInputType.name,
          ),
          SizedBox(height: 24,),
          TextFieldWidget(
            label:'Email',
            text: user.email,
            onChing:(email) => user = user.copy(email:email),
            typeof: TextInputType.name,
          ),
          SizedBox(height: 24,),
          TextFieldWidget(
            label:'About',
            text: user.about,
            maxLines:2,
            onChing:(about){ 
              user = user.copy(about:about);
              },
              typeof: TextInputType.name,
          ),
          SizedBox(height: 24,),

          playerplace.isEmpty == true ? Text("wait") : BuldList(),

          SizedBox(height: 24,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFieldWidget(
              label: 'العمر ',
              text: user.age.toString(),
              onChing: (age){
                user = user.copy(age: int.parse(age));
              },
              typeof: TextInputType.number,
              ),
          ),
          SizedBox(height: 24,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFieldWidget(
              label: 'الوزن ',
              text: user.weight.toString(),
              onChing: (weight){
                user = user.copy(weight: double.parse(weight));
              },
              typeof: TextInputType.number,
              ),
          ),
          SizedBox(height: 24,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFieldWidget(
              label: 'الطول ',
              text: user.hight.toString(),
              onChing: (hight){
                user = user.copy(hight: double.parse(hight));
              },
              typeof: TextInputType.number,
              ),
          ),
          SizedBox(height: 24,),
          BuldCity(),
          BuldArea(),
          Consumer<PlayerPlaceControler>(
            builder: (context, place, childe){
              return ButtonWidget(
              text: "svae", 
              onClicked: ()async{
                user = user.copy(playerPlace: Provider.of<PlayerPlaceControler>(context,listen: false).chosen.id);
                UserPreferences.setUser(user);
                print(UserPreferences.getUser().name);
                API.savedata(user,place.chosen.id);
                Navigator.of(context).pushReplacementNamed('mainpages');
                Provider.of<BuildAreaController>(context,listen: false).onChang(null) ;
                Provider.of<CitiesControler>(context,listen: false).onChang(null);
                
              }
              );}
            
             
          ),
            SizedBox(height: 24,),

        ],
      ),
    );
  }
}
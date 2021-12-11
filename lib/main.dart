// @dart=2.9
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kora/controller/playerplace_controler.dart';
import 'package:kora/modules/playerplace_moduel.dart';
import 'package:kora/modules/playerplace_service.dart';
import 'package:kora/pages/personal_page.dart/model/user_module.dart';
import 'package:kora/pages/personal_page.dart/model/user_prefrenece.dart';
import 'package:kora/pages/personal_page.dart/profile_page.dart';
import 'package:kora/screens/mainpages/requests/controller/getrequest.dart';
import 'package:kora/screens/mainpages/requests/controller/teamleadercontroller.dart';
import 'package:kora/screens/mainpages/team/createteam/module/area_module.dart';
import 'package:kora/screens/mainpages/team/createteam/module/city_module.dart';
import 'package:kora/screens/mainpages/team/createteam/module/team_type_number_module.dart';
import 'package:kora/screens/mainpages/team/createteam/service/bulfarea_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/cities_controller.dart';
import 'package:kora/screens/mainpages/team/createteam/service/city_service.dart';
import 'package:kora/screens/mainpages/team/createteam/service/teamtype_controller.dart';
import 'package:kora/screens/mainpages/team/show_teams/controllers/chalingcontoller.dart';
import 'package:kora/screens/mainpages/team/show_teams/controllers/get_team_info_controller.dart';
import 'package:kora/screens/mainpages/team/team.dart';
import 'package:kora/screens/singin_singup/createnewaccount.dart';
import 'package:kora/screens/singin_singup/forgatepassword.dart';
import 'package:kora/screens/singin_singup/loginscreen.dart';
import 'package:kora/screens/singin_singup/verifiction_page.dart';
import 'package:provider/provider.dart';
import 'controller/inteamcontroller.dart';
import 'modules/service_users.dart';
import 'modules/user_module.dart';
import 'pages/personal_page.dart/edit_profile_page.dart';
import 'bottomnavybar/bottomnavybar.dart';
import 'screens/mainpages/team/show_teams/controllers/date_time_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CityService city = CityService();
  final CitiesControler cities = CitiesControler();
  User user;
  String chikemail = "";
  bool isSing = false;
final ServiseUsers users = ServiseUsers();
final PlayerPlaceSevice playerplace = PlayerPlaceSevice();
// final InTeamController inteam = InTeamController();
  getprefs() async {
    user = UserPreferences.getUser();
    print(user.id);
    if (user.id != 0) {
      setState(() {
        isSing = true;
      });
    } else {
      setState(() {
        isSing = false;
      });
    }
  }

  void initState() {
    getprefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        FutureProvider(
      initialData: <Users>[],
      create: (context) => users.getPersonalInfo(),
      catchError: (context, error){
        print("error: "+ error.toString());
      },),
      ChangeNotifierProvider<PlayerPlaceControler>(
          create: (_) => PlayerPlaceControler()
          ),
      FutureProvider<List<PlayerPlace>>(
        initialData: <PlayerPlace>[],
        create: (_) => playerplace.getplayerplace(), 
        ),
      ChangeNotifierProvider<InTeamController>(
        create: (context) => InTeamController()
        ),
        ChangeNotifierProvider<GetTeamInfoController>(
          create: (context) => GetTeamInfoController(),
          ),
        ChangeNotifierProvider<GetRequestsController>(
          create: (context) => GetRequestsController(),
          ),
        ChangeNotifierProvider<ChalingController>(
          create: (context) => ChalingController(),
          ),
          FutureProvider(
          create: (context) => city.getCities(), 
          initialData: <Cities>[]
          ),
          ChangeNotifierProvider<CitiesControler>(
          create: (context) => CitiesControler()
          ),
          FutureProvider(
          create: (context) => city.getArea(cities.chosen), 
          initialData: <Area>[]
          ),
          ChangeNotifierProvider<BuildAreaController>(
            create:(context)=>BuildAreaController() ,
          ),
          ChangeNotifierProvider<TeamTypeController>(
            create:(context)=>TeamTypeController() ,
          ),
          FutureProvider(
          create: (context) => city.getTeamType(), 
          initialData: <TeamTypePlayersNumber>[]
          ),
          ChangeNotifierProvider<TeamLeaderControllers>(
            create:(context)=>TeamLeaderControllers() ,
          ),
          ChangeNotifierProvider<DateTimeController>(
            create: (context)=>DateTimeController(),
          ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.blue.shade300,
          dividerColor: Colors.black,
        ),
        routes: {
          'login': (context) => Login(),
          'forgatepassword': (context) => ForgatePassword(),
          'createnewaccount': (context) => CreateNewAccount(),
          'mainpages': (context) => MainPages(),
          'verifictionpage': (context) => VerifictionPage(),
          'myapp': (context) => MyApp(),
          'teams': (context) => TeamPage(),
          'personalinfo':(context) => ProfilePage(),
          'editprofilepage':(context) => EditProfilePage()
        },
        home: isSing ? MainPages() : Login(),
      ),
    );
  }
}
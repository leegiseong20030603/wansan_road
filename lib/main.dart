import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:provider/provider.dart';
import 'package:wansan_road/club/class/club.dart';
import 'package:wansan_road/club/ui/show_club.dart';
import 'package:wansan_road/home.dart';
import 'package:get/get.dart';

Future<void> main() async {
  KakaoContext.clientId = "ab9f7881a1316ae8ff76e885f89b39d0";
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WR_Club()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/show_club' : (context) => WR_ShowClubPage()
      },
    );
  }
}

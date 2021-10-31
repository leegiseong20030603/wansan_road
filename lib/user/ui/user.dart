import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:wansan_road/login/login.dart';
import 'package:wansan_road/public/ui/wr_button.dart';
import 'package:wansan_road/public/ui/wr_loading.dart';

class WR_UserProfilePage extends StatefulWidget {
  const WR_UserProfilePage({Key? key}) : super(key: key);

  @override
  _WR_UserProfilePageState createState() => _WR_UserProfilePageState();
}

class _WR_UserProfilePageState extends State<WR_UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TokenManager.instance.getToken(),
      builder: (BuildContext context, AsyncSnapshot<OAuthToken> _) {
        if(!_.hasData){
          return WR_Loading();
        }
        OAuthToken? token = _.data;
        if (token!.refreshToken == null) {
          return WR_LoginPage();
        } else {
          return Scaffold(
            appBar: _appBar(),
            body: _body(),
          );
        }
      },
    );
  }


  AppBar _appBar(){
    return AppBar(
      backgroundColor: Colors.blue[200],
      elevation: 0,
      centerTitle: true,
      title: Text("사용자"),
    );
  }

  Widget _body(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center ,
      child: WR_Button(
        child: Text("로그아웃"),
        onPressed: () {
          UserApi.instance.logout().then((value){
            setState(() {});
          });
        },
      ),
    );
  }
}


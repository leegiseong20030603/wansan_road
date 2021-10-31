import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:wansan_road/public/ui/wr_button.dart';

class WR_LoginPage extends StatefulWidget {
  const WR_LoginPage({Key? key}) : super(key: key);

  @override
  _WR_LoginPageState createState() => _WR_LoginPageState();
}

class _WR_LoginPageState extends State<WR_LoginPage> {

  late double height, width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.07),
            alignment: Alignment.center,
            child: Text("간편로그인", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          WR_Button(
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.green[500],
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("전화번호 로그인", style: TextStyle(color: Colors.white),),
            onPressed: (){

            }
          ),
          WR_Button(
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(10)
              ),
            child: Text("카카오톡 로그인", style: TextStyle(color: Colors.white),),
            onPressed: () async {
              try {
                bool installed = await isKakaoTalkInstalled();
                installed ? await UserApi.instance.loginWithKakaoTalk() : await UserApi.instance.loginWithKakaoAccount();
                // perform actions after login
                var token = await UserApi.instance.me();
                if(token != null){
                  setState(() {});
                }
              } catch (e) {
                print('error on login: $e');
              }
            }
          ),
          WR_Button(
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
            child: Text("애플 로그인", style: TextStyle(color: Colors.white),),
            onPressed: () async {
              final appleCredential = await SignInWithApple.getAppleIDCredential(
                scopes: [
                  AppleIDAuthorizationScopes.email,
                  AppleIDAuthorizationScopes.fullName,
                ],
                webAuthenticationOptions: WebAuthenticationOptions(
                  clientId: "com.leegiseong.wansanroad",
                  redirectUri: Platform.isIOS ? Uri.parse("https://wansan-road.firebaseapp.com/__/auth/handler") :
                      Uri.parse("intent://callback?https://wansan-road.firebaseapp.com/__/auth/handler#Intent;package=YOUR.PACKAGE.IDENTIFIER;scheme=signinwithapple;end")
                )
              );

              print(appleCredential.identityToken);
            }
          ),
        ],
      ),
    );
  }
}

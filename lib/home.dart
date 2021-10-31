import 'package:flutter/material.dart';
import 'package:wansan_road/club/ui/club.dart';
import 'package:wansan_road/user/ui/user.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double height, width;
  late int index;
  late List<Widget> body;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;

    body = [
      WR_ClubPage(),
      WR_UserProfilePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.blue[200],
      //   unselectedItemColor: Colors.grey,
      //   currentIndex: index,
      //   onTap: (int? _){
      //     setState(() {
      //       index = _!;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: "동아리검색"
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "프로필"
      //     ),
      //   ],
      // ),
      body: _body(),
    );
  }

  Widget _body(){
    return body[0];
    return body[index];
  }
}

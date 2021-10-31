import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wansan_road/club/class/club.dart';

class WR_ShowClubPage extends StatefulWidget {

  @override
  _WR_ShowClubPageState createState() => _WR_ShowClubPageState();
}

class _WR_ShowClubPageState extends State<WR_ShowClubPage> {

  late double height, width;
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    index = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    WR_Club club = Provider.of<WR_Club>(context);
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.blue[200],
            title: Text("${club.items![index]["name"]}"),
            expandedHeight: height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              background: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, _){
                  return Container(
                    width: width,
                    color: _ % 2 == 0 ? Colors.green : Colors.blue,
                  );
                },
              ),
            ),
          )
        ],
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(5)
                ),
                alignment: Alignment.center,
                height: height * 0.15,
                width: height * 0.15,
                child: Text("앱 로고"),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("${club.items![index]["season"]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("${club.items![index]["name"]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("${club.items![index]["type2"]}", style: TextStyle(fontSize: 24),),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("${club.items![index]["type1"]}"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: _container(
                  label: "진행한 행사",
                  contents: club.items![index]["event"]
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: _container(
                    label: "활동내용 및 성과",
                    contents: club.items![index]["activity"]
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: _container(
                    label: "기장의 느낌점",
                    contents: club.items![index]["feel"]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _container({
    required String label,
    required String contents
  }){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text("$label", style: TextStyle(fontSize: 24.5),),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.grey)
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          child: Text("$contents", style: TextStyle(fontSize: 21.2),),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wansan_road/club/class/club.dart';
import 'package:wansan_road/public/ui/wr_loading.dart';

class WR_ClubPage extends StatefulWidget {
  const WR_ClubPage({Key? key}) : super(key: key);

  @override
  _WR_ClubPageState createState() => _WR_ClubPageState();
}

class _WR_ClubPageState extends State<WR_ClubPage> {

  late WR_Club club;
  late double height, width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    club = Provider.of<WR_Club>(context, listen: false);
    Future.microtask((){
      club.filter = club.filters[0];
      club.request();
    });

  }

  @override
  Widget build(BuildContext context) {
    club = Provider.of<WR_Club>(context);
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      backgroundColor: Colors.blue[200],
      centerTitle: true,
      title: Text("동아리검색"),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: (){

          },
        )
      ],
    );
  }

  Widget _body(){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          alignment: Alignment.centerLeft,
          height: height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: club.filters.length,
            itemExtent: 100,
            itemBuilder: (context, _){
              String filter = club.filters[_];
              return GestureDetector(
                onTap: (){
                  club.filter = filter;
                  club.notifyListeners();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: club.filter == filter ? Colors.blue[200] : Colors.white,
                    border: club.filter == filter ? null : Border.all(width: 1, color: Colors.grey)
                  ),
                  alignment: Alignment.center,
                  child: Text("$filter", style: TextStyle(color: club.filter == filter ? Colors.white : Colors.grey),),
                ),
              );
            },
          ),
        ),
        Flexible(
          child: _list(),
        )
      ],
    );
  }

  Widget _list(){
    if(club.items == null && club.loading!){
      return WR_Loading();
    }

    List? items = [];
    if(club.filter != club.filters[0]){
      for(Map item in club.items!){
        if(item["type1"] == club.filter){
          items.add(item);
        }
      }
    }else{
      items = club.items;
    }

    return Container(
      child: GridView.builder(
          itemCount: items!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemBuilder: (context, _){
            Map item = items![_];
            return GestureDetector(
              onTap: (){
                Get.toNamed("/show_club", arguments: club.items!.indexOf(item));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey,
                          offset: Offset(0, 0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text("${item["name"]}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    Flexible(
                      child: Text("${item["type2"]}", style: TextStyle(fontSize: 11)),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

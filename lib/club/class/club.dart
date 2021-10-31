import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WR_Club extends ChangeNotifier {

  List? items;
  String? filter;
  List<String> filters = ["모두", "이과", "문과", "예체능"];
  bool? loading = false;
  
  Future request() async {

    loading = true;
    notifyListeners();

    var get = await http.get(
      Uri.parse("http://wroad.kro.kr/club/search.php"),
    );

    print(get.contentLength);
    var response = json.decode(get.body);

    if(response["status"] == 1){
      items = response["response"];
    }

    loading = false;
    notifyListeners();
  }
}
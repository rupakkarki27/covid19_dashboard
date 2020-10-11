// import 'dart:convert';

import 'package:covid19_dashboard/data_parse/CovidData.dart';
import 'package:http/http.dart' as http;


class Services {

   static  String _url = "https://corona.lmao.ninja/v2/countries?yesterday&sort";

    Future<List<Covid>> getCovidData() async {
    try {
      http.Response response = await http.get(_url);
      if(response.statusCode == 200){
        List<Covid> _covidList = covidFromJson(response.body);
        return _covidList;
      }else{
        return List<Covid>();
      }
    } catch (e){
      print(e);
      return List<Covid>();
    }
  }
}
import 'package:covid19_dashboard/data_parse/CovidData.dart';
import 'package:covid19_dashboard/screens/MoreDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:covid19_dashboard/constants/constants.dart';

class DetailsPage extends StatelessWidget {

  final Covid covidData;

  DetailsPage(this.covidData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(58, 66, 86, 1),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(covidData.country),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[    
            // CASES SUMMARY        
            ListTile(
              leading:SvgPicture.asset(totalCases, height:svgHeight, width:svgWidth, color: Colors.yellow,),
              title: Text("Total Cases", style: whiteText,),
              trailing: Text(covidData.cases.toString(), style: styleNumbers),
            ),
            ListTile(
              leading: SvgPicture.asset(deaths, height:svgHeight, width:svgWidth,
              color: Colors.red,),
              title: Text("Total Deaths", style: whiteText,),
              trailing: Text(covidData.deaths.toString(), style: styleNumbers),
            ),
            ListTile(
              leading: SvgPicture.asset(recovered, height:svgHeight, width:svgWidth, color: Colors.green,),
              title: Text("Total Recovered", style: whiteText,),
              trailing: Text(covidData.recovered.toString(), style: styleNumbers),
            ),
            ListTile(
              leading: SvgPicture.asset(activeCases, height:svgHeight, width:svgWidth, color: Colors.blue,),
              title: Text("Active Cases", style: whiteText,),
              trailing: Text(covidData.active.toString(), style: styleNumbers),
            ),
            Divider(
              height: 1.0,
              color: Colors.black,
            ),
            // NEW CASES DAILY
            ListTile(
              leading: SvgPicture.asset(totalCases, height:svgHeight, width:svgWidth, color: Colors.yellow,),
              title: Text("New Cases", style: whiteText,),
              trailing: Text("+" + covidData.todayCases.toString(), style: styleNumbers),
            ),
            ListTile(
              leading: SvgPicture.asset(deaths, height:svgHeight, width:svgWidth, color: Colors.red,),
              title: Text("New Deaths", style: whiteText,),
              trailing: Text("+" + covidData.todayDeaths.toString(), style: styleNumbers),
            ),
            ListTile(
              leading: SvgPicture.asset(recovered, height:svgHeight, width:svgWidth, color: Colors.green,),
              title: Text("New Recovered", style: whiteText,),
              trailing: Text("+" + covidData.todayRecovered.toString(), style: styleNumbers),
            ),
            Divider(
              height: 1.0,
              color: Colors.black,
            ),
            MaterialButton(
              child: Text("Click for more info", style: whiteText,),              
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoreDetails(covidData)
                  )
                );
              },
            ),
            Text("Last Updated: "+DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(covidData.updated)).toString() + "  " + DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(covidData.updated)).toString(), style:TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
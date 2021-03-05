import 'package:covid19_dashboard/constants/constants.dart';
import 'package:covid19_dashboard/data_parse/CovidData.dart';
import 'package:flutter/material.dart';

class MoreDetails extends StatelessWidget {

  final Covid covidData;
  MoreDetails(this.covidData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(58, 66, 86, 1),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text("More on "+ covidData.country),
      ),
      body: _buildCard(),
    );
  }

  Widget _buildCard() {
  
    return Container(
      margin: EdgeInsets.only(top:5.0),
      child: ListView(
      padding: EdgeInsets.symmetric(horizontal:9.0, vertical:10.0),
        children: <Widget>[
          // Total Population
          Card(
            elevation: 8.0,
            child: Container(
            decoration: boxDeco,
              child:ListTile(
                leading: iconPopulation,
                title: Text(population, style: styleTitle,),
                subtitle: Text(covidData.population.toString(), style: whiteText,),
              ),
            )
          ),
          // % of Infected Population
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconPercentInfected,
                title: Text(percentInfected, style: styleTitle,),
                subtitle: Text(((covidData.cases / covidData.population) * 100).toStringAsPrecision(3), style: whiteText,),
              ),
            )
          ),
          // Critical Cases
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconCritical,
                title: Text(critical, style: styleTitle,),
                subtitle: Text(covidData.critical.toString(), style: whiteText,),
              ),
            )
          ),
          // Total Tests
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconTest,
                title: Text(tests, style: styleTitle,),
                subtitle: Text(covidData.tests.toString(), style: whiteText,),
              ),
            )
          ),
          // Cases Per Million
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconCasesPerMillion,
                title: Text(casesPerMillion, style: styleTitle,),
                subtitle: Text(covidData.casesPerOneMillion.toString(), style: whiteText,),
              ),
            )
          ),
          // Deaths per Million
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconDeaths,
                title: Text(deathsPerMillion, style: styleTitle,),
                subtitle: Text(covidData.deathsPerOneMillion.toString(), style: whiteText,),
              ),
            )
          ),
          // Tests per Million
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconsTestPerMillion,
                title: Text(testsPerMillion, style: styleTitle,),
                subtitle: Text(covidData.testsPerOneMillion.toString(), style: whiteText,),
              ),
            )
          ),
          // Active Cases Per Million
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconActivePerMillion,
                title: Text(activePerMillion, style: styleTitle,),
                subtitle: Text(covidData.activePerOneMillion.toString(), style: whiteText,),
              ),
            )
          ),
          // Recovered Cases per Million
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconRecoverPerMillion,
                title: Text(recoveredPerMillion, style: styleTitle,),
                subtitle: Text(covidData.recoveredPerOneMillion.toString(), style: whiteText,),
              ),
            )
          ),
          // Critical cases per Million
          Card(
            elevation: 8.0,            
            child: Container(
              decoration: boxDeco,
              child:ListTile(
                leading: iconCriticalPerMillion,
                title: Text(criticalPerMillion, style: styleTitle,),
                subtitle: Text(covidData.criticalPerOneMillion.toString(), style: whiteText,),
              ),
            )
          ),
        ],
      ),
    );
  } 
}
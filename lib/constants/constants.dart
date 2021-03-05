import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

const styleNumbers = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white);
const styleTitle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
const whiteText = TextStyle(color: Colors.white);

const boxDeco = BoxDecoration(color: Color.fromRGBO(64, 75, 96, .94));

const String critical = "Critical Cases";
const String casesPerMillion = "Cases Per Million";
const String deathsPerMillion = "Deaths Per Million";
const String tests = "Total Tests";
const String testsPerMillion = "Tests Per Million";
const String population = "Population";
const String percentInfected = "% of Infected Population";
const String activePerMillion = "Active Cases Per Million";
const String recoveredPerMillion = "Total Recovered Per Million";
const String criticalPerMillion = "Critical Cases Per Million";

// SVG ASSETS
const String activeCases = "assets/svgs/active_cases.svg";
const String deaths = "assets/svgs/deaths.svg";
const String recovered = "assets/svgs/recovered.svg";
const String totalCases = "assets/svgs/total_cases.svg";


// SCG dimensions
const double svgHeight = 50;
const double svgWidth = 50;

//Icon Deco
final iconPadding = EdgeInsets.only(right: 12.0);
final iconBorder = Border(right: BorderSide(width: 1.0, color: Colors.white24,));

// More details Icons
const iconPopulation =Icon(Icons.nature_people, size: 50, color: Colors.green,);

const iconPercentInfected = Icon(FontAwesome.percent, size: 50, color: Colors.yellow,);

const iconCritical = Icon(FontAwesome.hospital_o, size: 50, color: Colors.red,);

const iconTest = Icon(FontAwesome.stethoscope, size: 50, color: Colors.orange,);

final iconCasesPerMillion = SvgPicture.asset(totalCases, height:50, width:50, color: Colors.yellow,);

final iconDeaths = SvgPicture.asset(deaths, height:50, width:50, color: Colors.red,);

const iconsTestPerMillion = Icon(Icons.pie_chart, size: 50, color: Colors.orange,);

const iconActivePerMillion = Icon(Icons.group, size: 50, color: Colors.blue,);

const iconRecoverPerMillion = Icon(Icons.local_hospital, size: 50, color: Colors.green,);

const iconCriticalPerMillion = Icon(Icons.local_hotel, size: 50, color: Colors.red,);

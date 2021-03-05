import 'dart:async';
import 'package:covid19_dashboard/constants/constants.dart';
import 'package:covid19_dashboard/data_parse/CovidData.dart';
import 'package:covid19_dashboard/http_services/Services.dart';
import 'package:covid19_dashboard/screens/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    title: "Covid Stats",
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      fontFamily: 'Lato',
    )));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Covid> _covidToDisplay = <Covid>[];
  List<Covid> _covid = <Covid>[];
  int sumCases = 0;
  int sumDeaths = 0;
  // Future _future;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    // _future = Services().getCovidData();
    Services().getCovidData().then((values) {
      setState(() {
        _covid = values;
        _covidToDisplay = _covid;
        for (int i = 0; i < _covid.length; i++) {
          sumCases += _covid[i].cases;
          sumDeaths += _covid[i].deaths;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_covid.isEmpty)
        ? Scaffold(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1),
            appBar: AppBar(
                elevation: 0.1,
                backgroundColor: Color.fromRGBO(58, 66, 86, 1),
                title: Text("Covid-19 Dashboard")),
            body: Center(child: CircularProgressIndicator()))
        : //Display either circular progress indicator or homescreen
        Scaffold(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1),
            appBar: AppBar(
              elevation: 0.1,
              backgroundColor: Color.fromRGBO(58, 66, 86, 1),
              title: Text("Covid-19 Dashboard"),
              actions: [
                IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        applicationName: "Covid-19 Dashboard by Rupak Karki",
                        applicationVersion: "1.0",
                        applicationIcon: SvgPicture.asset(
                          totalCases,
                          height: 100,
                          width: 100,
                        ),
                        applicationLegalese: "rupakkarki.com.np",
                      );
                    })
              ],
            ),
            body: RefreshIndicator(
              child: Scrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: _covidToDisplay.length + 1,
                  itemBuilder: (BuildContext context, index) {
                    return index == 0
                        ? _searchBar()
                        : _homePageCard(context, index - 1);
                  },
                ),
              ),
              onRefresh: _getData,
            ));
  }

  Future<void> _getData() async {
    setState(() {
      Services().getCovidData();
    });
  }

  _searchBar() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        child: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                onChanged: (query) {
                  _debouncer.run(() {
                    setState(() {
                      _covidToDisplay = _covid
                          .where((u) => (u.country
                              .toLowerCase()
                              .contains(query.toLowerCase())))
                          .toList();
                    });
                  });
                },
              )),
          Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                title: Text("Global Cases: " + sumCases.toString(),
                    style: whiteText),
                subtitle: Text(
                  "Global Deaths: " + sumDeaths.toString(),
                  style: whiteText,
                ),
              )),
        ]));
  }

  //HomePage Card Widget
  Widget _homePageCard(BuildContext context, index) {
    return Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(_covidToDisplay[index]),
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ))),
                child: Image.network(
                  _covidToDisplay[index].countryInfo.flag,
                  fit: BoxFit.scaleDown,
                  width: 100,
                ),
              ),
              title: Text(
                _covidToDisplay[index].country,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    "Total Cases: " + _covidToDisplay[index].cases.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            )));
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}


import 'package:flutter/material.dart';
import 'package:RTCV/tabPages/astraPage.dart';
import 'package:RTCV/tabPages/jjPage.dart';
import 'package:RTCV/tabPages/otherVaccine.dart';
import 'colours.dart' as color;

class VaccineInfo extends StatefulWidget {
  const VaccineInfo({Key? key}) : super(key: key);

  @override
  _VaccineInfoState createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {

  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
    initialIndex: 0,
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: color.AppColor.homePageBackground,
        elevation: 0.2,
        leading: IconButton(
          color: color.AppColor.homePageSubtitle,
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text('Vaccines',
        style: TextStyle(fontSize: 25,
            color: color.AppColor.homePageTitle,
            fontWeight: FontWeight.w700)
        ),
    //Writes the tab bar column names
    bottom: TabBar(
          tabs: <Widget>[
            Tab(
              child: Text('Johnson & Johnson',
                  style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700)),
            ),
            Tab(
              child: Text('Astrazeneca',
                  style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700)),
            ),
            Tab(
              child: Text('Both/Other',
                  style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700)),
            ),
          ],
          ),
        ),
      backgroundColor: color.AppColor.homePageBackground,
      body:
          // displays the tab contents of each tab, one after the other
          TabBarView(
            children: <Widget>[
              //calls the JJPage widget which has content for Johnson and Johnson, calls it as a function
              JJPage(),
              //calls the AstraPage widget which has content for Astrazeneca, calls it as a function
              AstraPage(),
              otherVaccine(),
            ],
          ),
    ),
    );
  }
}

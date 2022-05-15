import 'package:RTCV/tabPages/blantyreCity.dart';
import 'package:RTCV/tabPages/lilongweCity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colours.dart' as color;

class vacCenter extends StatefulWidget {
  const vacCenter({Key? key}) : super(key: key);

  @override
  _vacCenterState createState() => _vacCenterState();

}
class _vacCenterState extends State<vacCenter> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
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
          title: Text('Centres',
              style: GoogleFonts.getFont('Barlow Semi Condensed',
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  )
              ),
          ),
          //Writes the tab bar column names
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Southern Region',
                    style: GoogleFonts.getFont('Barlow Semi Condensed',
                        textStyle: TextStyle(
                          color: color.AppColor.homePageTitle,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                ),
              ),
              Tab(
                child: Text('Central Region',
                    style: GoogleFonts.getFont('Barlow Semi Condensed',
                        textStyle: TextStyle(
                          color: color.AppColor.homePageTitle,
                          fontWeight: FontWeight.w700,
                        )
                    ),),
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
            btz(),
            //calls the AstraPage widget which has content for Astrazeneca, calls it as a function
            llz(),
          ],
        ),
      ),
    );
  }
}

import 'package:RTCV/tabPages/blantyreCity.dart';
import 'package:RTCV/tabPages/lilongweCity.dart';
import 'package:RTCV/tabPages/northRegion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    return Scaffold(
        appBar: AppBar(
            centerTitle:true,
            automaticallyImplyLeading: false,
            backgroundColor: color.AppColor.homePageBackground,
            bottomOpacity: 0,
            elevation: 0,
            leading: IconButton(
              color: color.AppColor.homePageSubtitle,
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            title: Text('Rtcv',
              style:GoogleFonts.getFont('Satisfy',
                  textStyle: TextStyle(
                    fontSize: 38,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  )
              ),
            )
        ),
        backgroundColor: color.AppColor.homePageBackground,
        body: Container(
            padding: const EdgeInsets.only(top:15, left:30, right: 30, bottom: 30),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Please Choose A Region",
                          style: GoogleFonts.getFont('Barlow Semi Condensed',
                            textStyle: TextStyle(
                              color: color.AppColor.homePageTitle,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            )
                          ),
                      ),
                  ],
                ),
                SizedBox(height: 40,),
                Container(
                  height: 380,
                  width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(1),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          Container(
                            height: 15,
                            color: Colors.white,
                            child:
                            Container(
                              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  new ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:Colors.white,
                                        elevation: 0.1
                                    ),
                                    onPressed: (){},
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => const btz());
                                      },
                                      child: Center(
                                        child: Image.asset('assets/Map-of-southern-Malawi-showing-study-location.png',
                                          width: 100, height: 100,),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:10),
                                  Center(child: InkWell(
                                    onTap: () {
                                      Get.to(() => const btz());
                                    },
                                    child: Text('Southern Region',
                                        style: GoogleFonts.getFont('Barlow Semi Condensed',
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              color: color.AppColor.homePageTitle,
                                              fontWeight: FontWeight.w600,
                                            )
                                        )
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 15,
                            color: Colors.white,
                            child:
                            Container(
                              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  new ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:Colors.white,
                                        elevation: 0.1
                                    ),
                                    onPressed: (){},
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => const llz());
                                      },
                                      child: Center(
                                        child: Image.asset('assets/Districts-in-Malawi-s-central-region-5.png',
                                          width: 100, height: 100,),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:10),
                                  Center(child: InkWell(
                                    onTap: () {
                                      Get.to(() => const btz());
                                    },
                                    child: Text('Central Region',
                                        style: GoogleFonts.getFont('Barlow Semi Condensed',
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              color: color.AppColor.homePageTitle,
                                              fontWeight: FontWeight.w600,
                                            )
                                        )
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 15,
                            color: Colors.white,
                            child:
                            Container(
                              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  new ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:Colors.white,
                                        elevation: 0.1
                                    ),
                                    onPressed: (){},
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => const North());
                                      },
                                      child: Center(
                                        child: Image.asset('assets/1200px-Northern_in_Malawi.svg.png',
                                          width: 100, height: 100,),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:10),
                                  Center(child: InkWell(
                                    onTap: () {
                                      Get.to(() => const btz());
                                    },
                                    child: Text('Northen Region',
                                        style: GoogleFonts.getFont('Barlow Semi Condensed',
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              color: color.AppColor.homePageTitle,
                                              fontWeight: FontWeight.w600,
                                            )
                                        )
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                    )
                ),
              ],
            )
        )
    );
  }
}

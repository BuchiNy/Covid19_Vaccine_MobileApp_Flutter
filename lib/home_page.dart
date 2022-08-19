import 'package:RTCV/map.dart';
import 'package:RTCV/vaccineInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:RTCV/vaccenter.dart';
import 'colours.dart' as color;


class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        automaticallyImplyLeading: false,
        backgroundColor: color.AppColor.homePageBackground,
        bottomOpacity: 0,
        elevation: 0,
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
        child:
        Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Welcome, Friend",
                  style: GoogleFonts.getFont('Barlow Semi Condensed',
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: color.AppColor.homePageTitle,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        color.AppColor.gradientFirst.withOpacity(0.8),
                        color.AppColor.gradientSecond.withOpacity(0.9),
                      ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80)
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5,10),
                    blurRadius: 10,
                    color: color.AppColor.gradientSecond.withOpacity(0.2)
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get tested",
                        style: GoogleFonts.getFont('Barlow Semi Condensed',
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                    ),
                SizedBox(height: 10,),
                Text(
                    "Vaccine Available in All Centres",
                    style: GoogleFonts.getFont('Barlow Semi Condensed',
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: color.AppColor.homePageContainerTextSmall,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                ),
                    SizedBox(height: 10,),
                    Text(
                      "Protect your frends and loved ones",
                      style: GoogleFonts.getFont('Barlow Semi Condensed',
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: color.AppColor.homePageContainerTextSmall,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ),
                    // SizedBox(height: 25,),
                  ]
                ),
              ),
            ),
            SizedBox(height: 40),
            /*below are the buttons for the main features of the applications*/
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              child: CupertinoScrollbar(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(1),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    //Vaccine news button
                    Container(
                      height: 15,
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:Colors.white,
                                  elevation: 0.1
                              ),
                              onPressed: ()  async {
                                  final url = 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/covid-19-vaccines';
                                  if (await canLaunch(url)){
                                  await launch(
                                  url,
                                  forceSafariVC: true, //IOS
                                  forceWebView: true, // Android
                                  enableJavaScript: true, //Android
                                  );
                                }
                            },
                                child: Center(
                                  child: Image.asset('assets/273-2730047_forum-in-the-news-icon-online-newspaper-icon.png',
                                    width: 100, height: 100,),
                                ),
                              ),
                            SizedBox(height:10),
                            Center(child: Text('Vaccine News',
                                style: GoogleFonts.getFont('Barlow Semi Condensed',
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageTitle,
                                      fontWeight: FontWeight.w600,
                                    )
                                )
                            )
                            ),
                          ],
                        ),
                      ),

                    ),

                    //vaccine centre button
                    Container(
                      height: 15,
                      color: Colors.white,
                      child: Container(
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
                                  Get.to(() => const vacCenter());
                                },
                                child: Center(
                                  child: Image.asset('assets/free-hospital-icon-1066-thumb.png',
                                    width: 100, height: 100,),
                                ),
                              ),
                            ),
                            SizedBox(height:10),
                            Center(child: InkWell(
                              onTap: () {
                                Get.to(() => const vacCenter());
                              },
                              child: Text('Centres',
                                  style: GoogleFonts.getFont('Barlow Semi Condensed',
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        color: color.AppColor.homePageTitle,
                                        fontWeight: FontWeight.w600,
                                      )
                                  )
                              ),
                            )
                            ),
                          ],
                        ),
                      ),

                    ),

                    //vaccine information centre button
                    Container(
                      height: 15,
                      color: Colors.white,
                      child: Container(
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
                                  Get.to(() => const VaccineInfo());
                                },
                                child: Center(
                                  child: Image.asset('assets/istockphoto-939322694-612x612.jpg',
                                    width: 100, height: 100,)
                                ),
                              ),
                            ),
                            SizedBox(height:10),
                            Center(child: InkWell(
                              onTap: () {
                                Get.to(() => const VaccineInfo());
                              },
                              child: Text('Vaccine Centres',
                                  style: GoogleFonts.getFont('Barlow Semi Condensed',
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        color: color.AppColor.homePageTitle,
                                        fontWeight: FontWeight.w600,
                                      )
                                  )
                              ),
                            )
                            ),
                          ],
                        ),
                      ),
                    ),

                    //hospital location section
                    Container(
                      height: 15,
                      color: Colors.white,
                      child: Container(
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
                                  Get.to(() => const mapLocations());
                                },
                                child: Center(
                                  child: Image.asset('assets/577049-200.png',
                                  width: 100, height: 100,),
                                  ),
                                ),
                              ),
                            SizedBox(height:10),
                            Center(child: InkWell(
                              onTap: () {
                                Get.to(() => const mapLocations());
                              },
                                child: Text('Hospital Locations',
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
                  ],
                ),
                isAlwaysShown: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
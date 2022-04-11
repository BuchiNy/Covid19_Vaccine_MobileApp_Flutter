import 'package:RTCV/map.dart';
import 'package:RTCV/vaccineInfo.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        bottomOpacity: 0,
        elevation: 0,
        title: Text(
          "RTCV",
          style: TextStyle(fontSize: 25,
              color: color.AppColor.homePageTitle,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top:15, left:30, right: 30, bottom: 30),
        child:
        Column(
          children: [
            Row(
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Welcome to RTCV",
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(width: 5,),
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
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get tested",
                        style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.homePageContainerTextSmall

                ),
                    ),
                SizedBox(height: 5,),
                Text(
                    "Vaccine Available in All Centres",
                    style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageContainerTextSmall
                    ),
                ),
                    SizedBox(height: 5,),
                    Text(
                      "Protect your frends and loved ones",
                      style: TextStyle(
                          fontSize: 20,
                          color: color.AppColor.homePageContainerTextSmall
                      ),
                    ),
                    // SizedBox(height: 25,),
                  ]
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(0.8),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Container(
                    height: 20,
                    color: Colors.white,
                      child: new ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0.1
                        ),
                        onPressed: () async {
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
                        child: Container(
                          child: const Center(
                            child: CircleAvatar(
                              foregroundImage: AssetImage('assets/21601_1.png'),
                              radius: 65,
                            ),
                          ),
                        ),
                      ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.white,
                      child: new ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:Colors.white,
                            elevation: 0.1
                        ),
                        onPressed: () {},
                        child: InkWell(
                          onTap:() {
                            Get.to(() => const vacCenter());
                          },
                          child: const Center(
                              child: CircleAvatar(
                                foregroundImage: AssetImage('assets/blog_icons_4.png'),
                                radius: 65,
                              ),
                          ),
                        ),
                      ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.white,
                    child: new ElevatedButton(
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
                          child: CircleAvatar(

                            foregroundImage: AssetImage('assets/vaccine-illustration-injection-and-vaccine-bottle-covid-19-vaccine-virus-vaccine-fight-coronavirus-flat-illustration-design-healthcare-theme-design-vector-1.jpg'),
                            radius: 70,
                        ),
                      ),
                    ),
                  ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.white,
                    child: new ElevatedButton(
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
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/hospital-location-vector-38744409.jpg'),
                            radius: 65,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
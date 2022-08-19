import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:RTCV/colours.dart' as color;
import 'package:google_fonts/google_fonts.dart';

class llz extends StatefulWidget {
  const llz({Key? key}) : super(key: key);

  @override
  State<llz> createState() => _llzState();
}

class _llzState extends State<llz> {
  //query to display centers from the central
  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Region", isEqualTo: "Central Region").snapshots();
  @override
  Widget build(BuildContext context) => Scaffold(
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
      padding: const EdgeInsets.only(top:15, left:10, right: 10, bottom: 10),
      child: StreamBuilder<QuerySnapshot>(
        stream: centers,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasError){
            return Text('Something went wrong',
              style: TextStyle(
                  fontSize: 17
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Laoding');
          }
          return CupertinoScrollbar(
            child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document){
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return Card(
                    child: ListTile(
                      isThreeLine: false,
                      title: Text(data['Name'],
                        style: GoogleFonts.getFont('Barlow Semi Condensed',
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.location_on,
                            size:15,
                            color: color.AppColor.homePageIcons,
                          ),
                          Text('${data['Location']}',
                            style: GoogleFonts.getFont('Barlow Semi Condensed',
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: color.AppColor.homePageSubtitle,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),
                        ],
                      ),
                        leading: Image.network('${data['profilePic']}',
                          width: 70,),
                        // trailing: Icon(Icons.arrow_forward_ios,
                        //   size: 25,
                        //   color: color.AppColor.homePageIcons,
                        // )
                    ),
                  );
                }).toList()
            ),
            isAlwaysShown: false,
          );
        },
      ),
    ),
  );
}

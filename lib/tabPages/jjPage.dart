import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:RTCV/colours.dart' as color;
import 'package:google_fonts/google_fonts.dart';

class JJPage extends StatefulWidget {
  const JJPage({Key? key}) : super(key: key);

  @override
  State<JJPage> createState() => _JJPageState();
}

class _JJPageState extends State<JJPage> {

  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Vaccine type", isEqualTo: "Johnson & Johnson").where("Vaccine available", isGreaterThanOrEqualTo:20).snapshots();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: color.AppColor.homePageBackground,
      body: Container(
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
                        isThreeLine: true,
                        title: Text(
                          data['Name'],
                          style: GoogleFonts.getFont('Barlow Semi Condensed',
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: color.AppColor.homePageTitle,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                        ),
                        subtitle: Text(
                            '\nLocation: ${data['Location']}\n'
                                '\nVaccine left: ${data['Vaccine available']}',
                            style: GoogleFonts.getFont('Barlow Semi Condensed',
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: color.AppColor.homePageSubtitle,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
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
            );
          },
        ),
      ),
    );
}

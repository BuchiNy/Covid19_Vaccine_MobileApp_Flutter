import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:RTCV/colours.dart' as color;
import 'package:google_fonts/google_fonts.dart';

class otherVaccine extends StatefulWidget {
  const otherVaccine({Key? key}) : super(key: key);

  @override
  State<otherVaccine> createState() => _otherVaccineState();
}

class _otherVaccineState extends State<otherVaccine> {
  //centers variable being assigned the query statement to be able to display the centers with both vaccines
  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Vaccine type", isEqualTo: "Johnson & Johnson, Astrazeneca").where("Vaccine available", isGreaterThanOrEqualTo:20).snapshots();
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
              //display the snapshot from the database to show in the app
                children: snapshot.data!.docs.map((DocumentSnapshot document){
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return Card(
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(data['Name'],
                        style: GoogleFonts.getFont('Barlow Semi Condensed',
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                size: 15,
                                color: color.AppColor.homePageIcons,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                '${data['Location']}',
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
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Text('\nVaccine left: ${data['Vaccine available']}')
                            ],
                          )
                        ],
                      ),
                        leading: Image.network('${data['profilePic']}',
                          width: 70,),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:RTCV/colours.dart' as color;

class btz extends StatefulWidget {
  const btz({Key? key}) : super(key: key);

  @override
  State<btz> createState() => _btzState();
}

class _btzState extends State<btz> {

final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Region", isEqualTo: "Southern Region").snapshots();
final items = ['All', 'Blantyre', 'Thyolo'];
String? value;



  @override
  Widget build(BuildContext context) => Scaffold (
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
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10,),
              Text('Filter By Location',
                style: GoogleFonts.getFont('Barlow Semi Condensed',
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w600,
                    )
                ),
              ),
            ]
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                  color: color.AppColor.homePageIcons,
                  size: 25,
                ),
                value: value,
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(
                        ()=>this.value = value,
                ),

              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top:0, left:5, right: 5, bottom:0),
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
                      return Text('%Loading....');
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
                                  width: 70,
                                  height: 70,),
                              ),
                            );
                          }).toList()
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    ),
  );
  
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item,
      style: GoogleFonts.getFont('Barlow Semi Condensed',
      textStyle: TextStyle(
        fontSize: 18,
        color: color.AppColor.homePageTitle,
        fontWeight: FontWeight.w600,
      )
  ),
    ),
  );
  location (){
    String city;

  }
}

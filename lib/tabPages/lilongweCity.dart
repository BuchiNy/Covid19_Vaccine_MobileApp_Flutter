import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:RTCV/colours.dart' as color;

class llz extends StatefulWidget {
  const llz({Key? key}) : super(key: key);

  @override
  State<llz> createState() => _llzState();
}

class _llzState extends State<llz> {
  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Region", isEqualTo: "Central Region").snapshots();
  @override
  Widget build(BuildContext context) => Scaffold(
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
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(data['Name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    subtitle: Text(
                        '\nLocation: ${data['Location']}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                      leading: Image.network('${data['profilePic']}',
                        width: 70,),
                      trailing: Icon(Icons.arrow_forward_ios,
                        size: 25,
                        color: color.AppColor.homePageIcons,
                      )
                  ),
                );
              }).toList()
          );
        },
      ),
    ),
  );
}

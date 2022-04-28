import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:RTCV/colours.dart' as color;

class btz extends StatefulWidget {
  const btz({Key? key}) : super(key: key);

  @override
  State<btz> createState() => _btzState();
}

class _btzState extends State<btz> {
  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Region", isEqualTo: "Southern Region").snapshots();
  @override
  Widget build(BuildContext context) => Scaffold (
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
                        width: 70,
                      height: 70,),
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

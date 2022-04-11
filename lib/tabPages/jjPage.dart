import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class JJPage extends StatefulWidget {
  const JJPage({Key? key}) : super(key: key);

  @override
  State<JJPage> createState() => _JJPageState();
}

class _JJPageState extends State<JJPage> {

  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Vaccine type", isEqualTo: "Johnson & Johnson").where("Vaccine available", isGreaterThanOrEqualTo:20).snapshots();

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
                      title: Text(
                        data['Name'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      subtitle: Text(
                          data['Location'],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/hospital.png'),
                        radius: 20,
                      ),
                      // trailing: Icon(Icons.arrow_forward_ios,
                      //   size: 20,
                      //   color: color.AppColor.homePageIcons,
                      // )
                    ),
                  );
                }).toList()
            );
          },
        ),
      ),
    );
}

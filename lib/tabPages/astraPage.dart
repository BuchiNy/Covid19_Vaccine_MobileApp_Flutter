import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:RTCV/colours.dart' as color;


class AstraPage extends StatefulWidget {
  const AstraPage({Key? key}) : super(key: key);

  @override
  State<AstraPage> createState() => _AstraPageState();
}

class _AstraPageState extends State<AstraPage> {

  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Vaccine type", isEqualTo: "Astrazeneca").where("Vaccine available", isGreaterThanOrEqualTo:20).snapshots();
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
                    title: Text(
                      data['Name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    subtitle: Text(
                        '\nLocation: ${data['Location']}\n'
                            '\nVaccine left: ${data['Vaccine available']}',
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

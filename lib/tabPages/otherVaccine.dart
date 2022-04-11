import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class otherVaccine extends StatefulWidget {
  const otherVaccine({Key? key}) : super(key: key);

  @override
  State<otherVaccine> createState() => _otherVaccineState();
}

class _otherVaccineState extends State<otherVaccine> {

  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").where("Vaccine type", isEqualTo: "Johnson & Johnson, Astrazeneca").where("Vaccine available", isGreaterThanOrEqualTo:20).snapshots();
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
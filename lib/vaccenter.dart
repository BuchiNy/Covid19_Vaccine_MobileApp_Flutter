import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colours.dart' as color;

class vacCenter extends StatefulWidget {
  const vacCenter({Key? key}) : super(key: key);

  @override
  _vacCenterState createState() => _vacCenterState();

}
class _vacCenterState extends State<vacCenter> {
  final Stream<QuerySnapshot> centers = FirebaseFirestore.instance.collection("Centers").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.blueGrey,
          bottomOpacity: 0,
          elevation: 0,
          title: Text(
            "Centers",
            style: TextStyle(fontSize: 25,
                color: color.AppColor.homePageTitle,
                fontWeight: FontWeight.w700),
          ),
        ),
        body :
        Container(
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
}

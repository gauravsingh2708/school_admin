import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Class_info extends StatefulWidget {
  final cls;
  Class_info({this.cls});
  @override
  _Class_infoState createState() => _Class_infoState();
}

class _Class_infoState extends State<Class_info> {
  // ignore: non_constant_identifier_names
  Widget StudentCard(name,age,fName,rollNo,AdmNo,profileUrl,paid,gender) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        height: 170.0,
        width: size.width,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                child: Card(
                  color: Colors.red,
                  child: Image.network(
                    profileUrl,
                    fit: BoxFit
                        .cover,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Admission No. : $AdmNo'),
                        Text('Name : $name'),
                        Text('Gender : $gender'),
                        Text('Roll no : $rollNo'),
                        Text('$fName'),
                        Text('Paid UpTo : $paid'),

                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Class ${widget.cls}'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("Student")
                .where('class', isEqualTo: "${widget.cls}")
                .snapshots(),
            // ignore: missing_return
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return new Text(
                    'Error: ${snapshot.error}');
              }
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Loading..."),
                      SizedBox(
                        height: 50.0,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                );
              }
              else{
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (_, index) => LayoutBuilder(builder: (ctx, constraint){
                      return StudentCard(
                        snapshot.data.documents[index].data["name"],
                        snapshot.data.documents[index].data["age"],
                        snapshot.data.documents[index].data["father name"],
                        'na',
                        snapshot.data.documents[index].data["admission no"],
                        snapshot.data.documents[index].data["profile pic"],
                        snapshot.data.documents[index].data["paid"],
                        snapshot.data.documents[index].data["gender"],

                      );},)
                );

              }
            }));
  }
}

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_admin/screen/Payment.dart';

class StudentInfo extends StatefulWidget {
  final admNo;
  StudentInfo({this.admNo});
  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  bool _isLoading;
  var document;
  String name ,age,fName,mName,phone,address,cls,profileUrl,gender,paid;
  // ignore: missing_return
  Future <void> getStudentInfo(admNO) async{
    document = await Firestore.instance.collection('Student').document(admNO).get().then((DocumentSnapshot document){
      if(document.data!=null){
        name=document['name'];
        fName=document['father name'];
        mName=document['mother name'];
        age=document['age'];
        cls=document['class'];
        phone=document['phone'];
        profileUrl=document['profile pic'];
        gender=document['gender'];
        paid=document['paid'];

        setState(() {
          _isLoading=false;
        });
      }
      else{
        Fluttertoast.showToast(
            msg: "Enter Correct Admission number",
            timeInSecForIos: 4,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.teal,
            textColor: Colors.white
        );
        Navigator.pop(context);
      }
    });

  }
  void initState() {
    super.initState();
    _isLoading=true;
    getStudentInfo(widget.admNo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admission No. : ${widget.admNo}'),
      ),
      body: _isLoading?Center(child: CircularProgressIndicator(),):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        color: Colors.red,
                        child:Image.network(
                          profileUrl,
                          fit: BoxFit
                              .cover,
                        ),
                      )))),
          Divider(
            color: Colors.teal,
          ),
          Center(
              child: Text(
            '$name',
            style: TextStyle(fontSize: 25.0, color: Colors.teal),
          )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Father Name : $fName',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Gender : $gender',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Mother Name : $mName',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Age : $age',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Class : $cls',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Phone : $phone',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Year : 2020',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Fee Paid UpTo : $paid',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )),
          Divider(
            color: Colors.teal,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
              },
              child: Text('Fee Payment',
                  style: TextStyle(fontSize: 20.0, color: Colors.white,fontStyle: FontStyle.italic)),
              color: Colors.teal,
            ),
          )
        ],
      ),
    );
  }
}

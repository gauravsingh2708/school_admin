import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_admin/screen/Payment.dart';
import 'package:school_admin/screen/adm_screen.dart';
import 'package:school_admin/screen/class_info.dart';
import 'package:school_admin/screen/student_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Homa_screen extends StatefulWidget {
  @override
  _Homa_screenState createState() => _Homa_screenState();
}

class _Homa_screenState extends State<Homa_screen> {
  final _formKey = new GlobalKey<FormState>();
  String admNo;
  List cls = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  String _timeString;

  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(child: Text('$_timeString')))
        ],
      ),
      drawer: Drawer(),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(13.0),
              child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Form(
                      key: _formKey,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            autofocus: false,
                            validator: (value) => value.isEmpty ? '' : null,
                            onSaved: (value) => admNo = value.trim(),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Admission Number',
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.teal,
                                    ),
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      form.save();
                                      if (admNo.length != 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StudentInfo(admNo: admNo)));
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Enter Admission number",
                                            timeInSecForIos: 4,
                                            gravity: ToastGravity.CENTER,
                                            backgroundColor: Colors.teal,
                                            textColor: Colors.white);
                                      }
                                    })),
                            keyboardType: TextInputType.number,
                          ))))),
          Padding(
              padding: EdgeInsets.only(left: 0.1, right: 0.1, bottom: 15),
              child: Container(
                  height: size.height * 0.10,
                  width: size.width,
                  child: Card(
                    color: Colors.teal,
                    shadowColor: Colors.teal,
                    elevation: 1.0,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            cls.length,
                            (index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Class_info(
                                                cls: cls[index],
                                              )));
                                },
                                child: Container(
                                    height: size.height * 0.10,
                                    width: size.height * 0.10,
                                    child: Card(
                                        child: Center(
                                            child: Text(
                                      '${cls[index]}',
                                      style: TextStyle(fontSize: 25),
                                    ))))))),
                  ))),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Admission()));
                  },
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, blurRadius: 5.0)
                        ]),
                    child: Center(
                      child: Text(
                        'Admission',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Admission()));
                  },
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.teal),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, blurRadius: 5.0)
                        ]),
                    child: Center(
                      child: Text(
                        'Registration',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Payment()));
                },
                  child: Container(
                height: size.height * 0.08,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.teal, blurRadius: 5.0)
                    ]),
                child: Center(
                  child: Text(
                    'Payment',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ))),
          Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.teal, blurRadius: 5.0)
                    ]),
              )),
        ],
      ),
    );
  }
}

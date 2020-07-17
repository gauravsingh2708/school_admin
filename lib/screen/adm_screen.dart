import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_admin/firebase_methods.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:school_admin/screen/AdmissionPdfView.dart';

class Admission extends StatefulWidget {
  @override
  _AdmissionState createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission> {
  bool pageLoading = false;
  bool _isLoading = false;
  var image;
  // ignore: non_constant_identifier_names
  String profile_url;
  FirebaseMethod firebaseMethod = FirebaseMethod();
  final pdf = pw.Document();
  String name, fName, mName, age, admNo, cls, address, phone, _gender,hostel,bus;
  final _formKey = new GlobalKey<FormState>();
  Future<void> getImage() async {
    setState(() {
      _isLoading = true;
    });
    image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 150, maxWidth: 150);
    profile_url = await firebaseMethod
        .uploadImageToStorage(image)
        .whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  void writeOnPdf(){
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(20),
          build: (pw.Context context){
            return <pw.Widget>  [
              pw.Header(
                  level: 0,
                  child: pw.Center(child:pw.Text("Vidyapeeth Education",style: pw.TextStyle(fontSize: 30.0)))
              ),
              pw.Column(
                children: <pw.Widget>[
                  pw.Row(
                      children: <pw.Widget>[
                        
                      ]
                  )
                ]
              )
            ];
          },
      )
    );
  }
  Future savePdf(admNo) async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/$admNo.pdf");

    file.writeAsBytesSync(pdf.save());
  }
  @override
  Widget build(BuildContext context) {
    return pageLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              ),
            ),
            color: Colors.white,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Admission'),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  getImage();
                },
                child: Icon(Icons.camera)),
            body: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(
                          child: Container(
                              height: 150.0,
                              width: 150.0,
                              child: Card(
                                elevation: 2.0,
                                child: _isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : image == null
                                        ? Image(
                                            image:
                                                AssetImage("assets/h2OjHz.jpg"))
                                        : Image.file(image),
                              )))),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Gender",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 19),
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'Male',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                                activeColor: Colors.teal,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 19),
                              ),
                            ],
                          ),
                          Row(children: <Widget>[
                            Radio(
                              value: 'Female',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                              activeColor: Colors.teal,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 19),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter the Admission Number' : null,
                        onSaved: (value) => admNo = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Admission Number',
                            labelText: 'Admission Number',
                            prefixIcon: Icon(Icons.person)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter the Name' : null,
                        onSaved: (value) => name = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Student Name',
                            labelText: 'Student Name',
                            prefixIcon: Icon(Icons.person)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter the Father Name' : null,
                        onSaved: (value) => fName = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Father Name',
                            labelText: 'Father Name',
                            prefixIcon: Icon(Icons.person_outline)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter the Mother Name' : null,
                        onSaved: (value) => mName = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mother Name',
                            labelText: 'Mother Name',
                            prefixIcon: Icon(Icons.person)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) => value.isEmpty
                            ? 'Enter the Phone Number'
                            : value.length != 10
                                ? 'Enter correct phone Number'
                                : null,
                        onSaved: (value) => phone = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone',
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value.isEmpty ? 'Enter the Age' : null,
                        onSaved: (value) => age = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Age',
                            labelText: 'Age',
                            prefixIcon: Icon(Icons.calendar_today)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) => value.isEmpty
                            ? 'Enter the Class'
                            : int.parse(value) > 10
                                ? "Enter correct class"
                                : null,
                        onSaved: (value) => cls = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Class',
                            labelText: 'Class',
                            prefixIcon: Icon(Icons.class_)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter the Address' : null,
                        onSaved: (value) => address = value.trim(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address',
                            labelText: 'Address',
                            prefixIcon: Icon(Icons.location_city)),
                      )),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "BUS",
                            style:
                            TextStyle(color: Colors.black54, fontSize: 19),
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'Yes',
                                groupValue: bus,
                                onChanged: (value) {
                                  setState(() {
                                    bus = value;
                                  });
                                },
                                activeColor: Colors.teal,
                              ),
                              Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 19),
                              ),
                            ],
                          ),
                          Row(children: <Widget>[
                            Radio(
                              value: 'No',
                              groupValue: bus,
                              onChanged: (value) {
                                setState(() {
                                  bus = value;
                                });
                              },
                              activeColor: Colors.teal,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 19),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Hostel",
                            style:
                            TextStyle(color: Colors.black54, fontSize: 19),
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'Yes',
                                groupValue: hostel,
                                onChanged: (value) {
                                  setState(() {
                                    hostel = value;
                                  });
                                },
                                activeColor: Colors.teal,
                              ),
                              Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 19),
                              ),
                            ],
                          ),
                          Row(children: <Widget>[
                            Radio(
                              value: 'No',
                              groupValue: hostel,
                              onChanged: (value) {
                                setState(() {
                                  hostel= value;
                                });
                              },
                              activeColor: Colors.teal,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 19),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.teal,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, left: 30, right: 30, bottom: 10.0),
                    child: MaterialButton(
                      height: 50.0,
                      onPressed: () {
                        if (profile_url != null) {
                          if (validateAndSave()) {
                            setState(() {
                              pageLoading = true;
                            });
                            firebaseMethod.Register(admNo, name, fName, mName,
                                    phone, age, cls, address, profile_url,_gender)
                                .whenComplete(() async {
                              setState(() {
                                pageLoading = false;
                              });
                              writeOnPdf();
                              await savePdf(admNo);
                              Directory documentDirectory = await getApplicationDocumentsDirectory();

                              String documentPath = documentDirectory.path;

                              String fullPath = "$documentPath/$admNo.pdf";

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PdfPreviewScreen(path: fullPath,)
                              ));
                            });
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "Take Photo of Student",
                              timeInSecForIos: 4,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.teal,
                              textColor: Colors.white);
                        }
                      },
                      color: Colors.teal,
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_admin/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          child: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              height: size.height * 0.50,
              width: size.width * 0.95,
              child: Card(
                  elevation: 1.0,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('School Name',style: TextStyle(fontSize: 25,color: Colors.white)),
                      SizedBox(height: 20.0,),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'User Name',
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                            ),
                            validator: (value) =>
                                value.isEmpty ? 'UserName  can\'t empty' : null,
//                            onSaved: (value) => company = value.trim(),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                            ),
                            validator: (value) =>
                                value.isEmpty ? 'Password9 can\'t empty' : null,
//                            onSaved: (value) => company = value.trim(),
                          )),
                      MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homa_screen()));
                        },
                        child: Text('LOGIN',style: TextStyle(fontSize: 20,color: Colors.white),),
                        color: Colors.teal,
                      )
                    ],
                  ))),
        ),
      )),
    );
  }
}

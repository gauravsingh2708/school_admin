import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fee Payment',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  'Gaurav kumar',
                  style: TextStyle(fontSize: 25.0, color: Colors.teal),
                ),
              ),
            ),
            Divider(
              color: Colors.teal,
            ),
            DataTable(
              columnSpacing: 200.0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Charge Type',
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Amount',
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),
                  ),
                ),

              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Tuition Fee',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('500',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Transport Fee',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('100',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Computer Fee',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('15',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Hostel Fee',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('15',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sports Fee',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('15',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Late Fine',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('15',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Total',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                    DataCell(Text('1000',
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15.0),)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

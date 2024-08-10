import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Aunthatication_lst extends StatefulWidget {
  const Aunthatication_lst({super.key});

  @override
  State<Aunthatication_lst> createState() => _Aunthatication_lstState();
}

class _Aunthatication_lstState extends State<Aunthatication_lst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('VENDOR NAME : '), Text('niranjan')],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('VENDOR PHONE NO : '), Text('9731885330')],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('VENDOR ADDRESS :'),
                  Text('FG76QTUFH3'),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('VENDOR GST NO : '), Text('9731885330')],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('VENDOR PAN NO : '), Text('9731885330')],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('VENDOR CIN NO : '), Text('9731885330')],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('VENDOR AADHAR  NO : '), Text('9731885330')],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('TYPE OF VENDOR : '), Text('FHEB')],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class add_prefrences extends StatefulWidget {
  const add_prefrences({super.key});

  @override
  State<add_prefrences> createState() => _add_prefrencesState();
}

class _add_prefrencesState extends State<add_prefrences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TARGET ADVERTISEMENTS'),
      ),
      backgroundColor: Colors.black,
    );
  }
}

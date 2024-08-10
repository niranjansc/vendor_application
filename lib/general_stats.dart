import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class generalstats extends StatefulWidget {
  const generalstats({super.key});

  @override
  State<generalstats> createState() => _generalstatsState();
}

class _generalstatsState extends State<generalstats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VENDOR STATS'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'VENDOR STATS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Colors.black54,
              ),
              Text(
                "Today's Burnnings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
              Text(
                "Weekly Burnnings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
              Text(
                "Monthly Burnnings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
              Text(
                "Burnnings Till Date",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
            ]),
            height: 220,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ADVERTISE STATS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Colors.black54,
              ),
              Text(
                "Today's Burnnings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
              Text(
                "Weekly Burnnings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
              Text(
                "Monthly Burnnings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
              Text(
                "Burnnings Till Date",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(
                indent: 35,
                endIndent: 35,
                thickness: 1,
                color: Colors.black54,
              ),
            ]),
            height: 220,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ]),
    );
  }
}

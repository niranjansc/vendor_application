import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/spl_rglr_profilemodel.dart';

class spl_rglr_profilecard extends StatefulWidget {
  const spl_rglr_profilecard({super.key, required this.datamodel});
  final spl_rglr_profilemodel datamodel;

  @override
  State<spl_rglr_profilecard> createState() => _spl_rglr_profilecardState();
}

class _spl_rglr_profilecardState extends State<spl_rglr_profilecard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        color: widget.datamodel.type == "1" ? Colors.amber : Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.datamodel.name),
              Text(widget.datamodel.adName),
            ],
          ),
        ),
      ),
    );
  }
}

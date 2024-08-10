import 'package:flutter/material.dart';
import 'package:new_vendor/dopa_glb.dart';
import 'package:provider/provider.dart';

class LD_mode extends StatefulWidget {
  const LD_mode({super.key});

  @override
  State<LD_mode> createState() => _LD_modeState();
}

class _LD_modeState extends State<LD_mode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Switch(
        // This bool value toggles the switch.
        value: isDark,
        activeColor: Colors.red,
        onChanged: (bool value) {
          // This is called when the user toggles the switch.
          setState(() {
            isDark = value;

            print('isdark = $isDark');
          });
        },
      )),
    );
  }
}

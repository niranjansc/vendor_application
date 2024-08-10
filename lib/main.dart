
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_vendor/LD_mode.dart';
import 'package:new_vendor/dark_mode_provider.dart';
import 'package:new_vendor/login.dart';
import 'package:new_vendor/newLogin.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:provider/provider.dart';
// import 'package:vendor/view_location.dart';

ThemeData lg = ThemeData(
  primaryColor: Color.fromARGB(255, 175, 76, 76),
  brightness: Brightness.light,
);

ThemeData Dk = ThemeData(
    primaryColor: Color.fromARGB(255, 175, 76, 76),
    brightness: Brightness.dark);

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      LD_mode();
    },
    child: GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 175, 76, 76),
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,

      initialRoute: 'login',
      routes: {'login': (context) => login()},
      // home: _MyAppState(),
    ),
  ));
}

// class loginpage extends StatelessWidget {
//   const loginpage({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Vendor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'e'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

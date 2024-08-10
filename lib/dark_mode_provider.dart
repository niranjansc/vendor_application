import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dark_mode_provider.dart';

class DarkModeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DarkModeProvider(),
      child: Consumer<DarkModeProvider>(
        builder: (context, darkModeProvider, _) {
          return MaterialApp(
            title: 'Dark Mode Demo',
            theme: ThemeData(
              brightness: darkModeProvider.isDarkMode
                  ? Brightness.dark
                  : Brightness.light,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dark Mode Demo'),
      // ),
      body: Center(
        child: Switch(
          value: darkModeProvider.isDarkMode,
          onChanged: (value) {
            darkModeProvider.toggleDarkMode();
          },
        ),
      ),
    );
  }
}

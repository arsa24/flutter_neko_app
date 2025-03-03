import 'package:flutter/material.dart';
import 'package:neko_app/components/navbar.dart';
import 'package:neko_app/components/toggle_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ToggleProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToggleProvider>(builder: (context, toggleprov, child) {
      return MaterialApp(
        theme: ThemeData(
            brightness: toggleprov.isDarkMode ? Brightness.dark : Brightness.light),
        home: Navbar(),
      );
    });
  }
}

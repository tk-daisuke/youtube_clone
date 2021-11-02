import 'package:appbar_custom/view/explore_screen.dart';
import 'package:appbar_custom/view/home_screen.dart';
import 'package:appbar_custom/view/navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        ExploreScreen.id: (context) => const ExploreScreen(),
      },
      home: const Navigation(),
    );
  }
}

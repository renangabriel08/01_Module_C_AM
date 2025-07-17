import 'package:c1/pages/artists.dart';
import 'package:c1/pages/explore.dart';
import 'package:c1/pages/exposition.dart';
import 'package:c1/pages/home.dart';
import 'package:c1/pages/tickets.dart';
import 'package:c1/styles/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Cores.amarelo),
        fontFamily: 'PlayfairDisplay',
      ),
      routes: {
        '/home': (context) => const Home(),
        '/artists': (context) => const Artists(),
        '/explore': (context) => const Explore(),
        '/tickets': (context) => const Tickets(),
        '/exposition': (context) => const Exposition(),
      },
      initialRoute: '/home',
    );
  }
}

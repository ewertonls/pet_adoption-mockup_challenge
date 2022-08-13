import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

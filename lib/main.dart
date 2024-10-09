import 'package:flutter/material.dart';
import 'package:mid_zehraimam_26946/screen/home.dart';


void main(){//main function in adding_model
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

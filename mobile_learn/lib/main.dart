import 'package:flutter/material.dart';
import './practice01.dart';
import '/intro.dart';

void main() {
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Practice01Screen(), 
    );
  }
}

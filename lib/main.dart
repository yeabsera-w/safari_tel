import 'package:flutter/material.dart';
import 'view/screens/main_screen.dart';
void main(){
  runApp(const SafeArea(child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppScreen(),
  )));
}
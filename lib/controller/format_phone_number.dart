import 'package:flutter/material.dart';
String formatPhoneNumber(String number){
  if(number.startsWith("+251")){
    debugPrint(number);
    number = number.replaceRange(0, 4, "0").replaceAll(" ", "");
  }
  return number;
}
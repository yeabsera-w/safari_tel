import 'package:flutter/material.dart';
import 'package:ussd_service/ussd_service.dart';
makeRequest(String ussdCode) async {
    int subscriptionId = 4; // sim card subscription ID // ussd code payload
    try {
      String? ussdResponseMessage = await UssdService.makeRequest(
          subscriptionId,
          ussdCode,
          const Duration(seconds: 20),
           // timeout (optional) - default is 10 seconds
      );
      return ussdResponseMessage;
    } catch(e) {
      debugPrint("error! code: ${e.hashCode} - message: ${e.toString()}");
    }
  }
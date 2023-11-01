import 'package:flutter/material.dart';
import 'show_balance_ethio_telecom.dart';
import 'show_balance_safari.dart';
import '../../controller/ussd_request.dart';
import './safarcom_recharge.dart';
import 'ethio_telecom_recharge_loading_widget.dart';
import '../../controller/request_cubit.dart';
import 'call_me.dart';
chooseNet(
    BuildContext context,
    bool toCheckBalance,
    bool toRecharge,
    bool toTransfer,
    bool toReqCallMeBack,
    String number,
   )async{
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("choose network"),
        content: SizedBox(
          height: 150,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: GestureDetector(
                  onTap: () {
                    if(toCheckBalance){
                      Navigator.pop(context);
                      showBalanceSafaricom(context);
                      makeRequest("*704#");
                    }
                    else if(toRecharge){
                      Navigator.pop(context);
                      safaricomRecharge(context);
                      makeRequest("*705*$number#");
                    }
                  },
                  child: Image.asset("lib/images/safaricom.png")
                )
                ),
               GestureDetector(
                onTap: () {
                    if(toCheckBalance){
                      Navigator.pop(context);
                      showBalanceEthioTelecom(context);
                      makeRequest("*804#");
                    }else if(toRecharge){
                      Navigator.pop(context);
                      ethioTelecomRecharge(context);
                      makeRequest("*805*$number#");
                    }
                    else if(toTransfer){
                      Navigator.pop(context);
                      normalUSSDRequest("*806*$number");
                    }else if(toReqCallMeBack){
                      Navigator.pop(context);
                      callme(context);
                      makeRequest("*807*$number#");
                    }
                  },
                 child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Image.asset("lib/images/ethioTelecom.png")
                      ),
                      const Text("Ethio Telecom")
                    ],
                  ),
               )
            ],
          ),
        ),
      );
    });
  }
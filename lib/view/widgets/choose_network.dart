import 'package:flutter/material.dart';
import 'show_balance_ethio_telecom.dart';
import 'show_balance_safari.dart';
import 'package:safaritel/controller/permission_handler.dart';
import 'ethio_telecom_recharge_loading_widget.dart';
import '../../controller/request_cubit.dart';
import 'call_me.dart';

class ChooseNetworkDialog extends StatelessWidget {
  const ChooseNetworkDialog(
      {this.toCheckBalance = false,
      this.toRecharge = false,
      this.toTransfer = false,
      this.toReqCallMeBack = false,
      this.number = "",
      super.key});

  final bool toCheckBalance;
  final bool toRecharge;
  final bool toTransfer;
  final bool toReqCallMeBack;
  final String number;
  void makeRequest(String code) async {
    if (await isCallPermissionGranted()) {
      cubit.ussdRequest(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(146, 0, 0, 0),
      title: Container(
          decoration: const BoxDecoration(),
          child: const Center(
              child: Text(
            "Choose your network",
            style: TextStyle(
                color: Color.fromARGB(255, 31, 160, 31),
                fontWeight: FontWeight.bold),
          ))),
      content: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: Color.fromARGB(147, 76, 175, 79),
              thickness: 1.0,
            ),
            SizedBox(
                child: GestureDetector(
              onTap: () {
                if (toCheckBalance) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: ((context) => const ShowBalanceSafari()));
                  makeRequest("*704#");
                } else if (toRecharge) {
                  Navigator.pop(context);

                  makeRequest("*705*$number#");
                } else if (toTransfer) {
                  Navigator.pop(context);
                  normalUSSDRequest("*706*$number");
                }
              },
              child: SizedBox(
                  height: 50, child: Image.asset("lib/images/safaricom.png")),
            )),
            const Divider(
              color: Color.fromARGB(155, 76, 175, 79),
              thickness: 1.0,
            ),
            GestureDetector(
              onTap: () {
                if (toCheckBalance) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: ((context) => const EthioTelShowBalance()));
                  makeRequest("*804#");
                } else if (toRecharge) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: ((context) => const EthioTelRecharge()));
                  makeRequest("*805*$number#");
                } else if (toTransfer) {
                  Navigator.pop(context);
                  normalUSSDRequest("*806*$number#");
                } else if (toReqCallMeBack) {
                  Navigator.pop(context);
                  callme(context);
                  makeRequest("*807*$number#");
                }
              },
              child: Row(
                children: [
                  SizedBox(
                      width: 50,
                      child: Image.asset("lib/images/ethioTelecom.png")),
                  const Text(
                    "Ethio Telecom",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

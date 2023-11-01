import 'package:flutter/material.dart';
import '../../controller/request_cubit.dart';
import 'show_balance_ethio_telecom.dart';

void safaricomRecharge(BuildContext context) async{
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 200,
          width: 300,
          child: StreamBuilder(
            stream: cubit.stream,
            builder: (context, snapshot) {
              final loading = SizedBox(
                height: 150,
                child: load
              );
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return loading;
                case ConnectionState.waiting:
                  return loading;
                case ConnectionState.active:
                  debugPrint(snapshot.data);
                  if(snapshot.data!.contains("Sorry, the recharge voucher PIN you have entered is invalid.")){
                      return const SizedBox(
                        width: 150,
                        child: Center(
                          child: Text("Voucher number doesn't exist! \nplease try again",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          ),
                        ),
                      );
                    }
                    else{
                      return const SizedBox();
                    }
                case ConnectionState.done:
                  return const SizedBox();
              }
            }
          ),
        ),
      );
    });
  }
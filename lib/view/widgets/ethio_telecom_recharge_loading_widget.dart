import 'package:flutter/material.dart';
import '../../controller/request_cubit.dart';
import 'show_balance_ethio_telecom.dart';
void ethioTelecomRecharge(BuildContext context) async{
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
                  if(snapshot.data!.contains("Dear Customer,the card number you entered does not exist. Sorry  recharging failed.ethio telecom") || snapshot.data!.contains("Dear Customer, The voucher PIN you entered is invalid")){
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
                    }else if(snapshot.data!.contains("Dear customer,The length of the recharge card number you entered is wrong. please  enter the correct card number.ethio telecom")){
                      return const SizedBox(
                        width: 150,
                        child: Center(
                          child: Text("Voucher number lenght short! please try again",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          ),
                        ),
                      );
                    }else if(snapshot.data!.contains("Dear customer,The length of the recharge card number you entered is wrong. please  enter the correct card number.ethio telecom")){
                      return const SizedBox(
                        width: 150,
                        child: Center(
                          child: Text("Voucher number lenght short! please try again",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          ),
                        ),
                      );
                    }if(snapshot.data!.contains("Dear Customer, operation failed, please try again or contact the contact center.ethio telecom")){
                      return const SizedBox(
                        width: 150,
                        child: Center(
                          child: Text("Voucher number lenght short or too long! please try again",
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
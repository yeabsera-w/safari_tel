import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class TransferScreen extends StatefulWidget {
  final dynamic callback;
  const TransferScreen({
      required this.callback,
      super.key,
    }
    );

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context,) {
    TextEditingController contactController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 255, 243),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(
                    top: MediaQuery.of(context).size.height/3,
                    left: MediaQuery.of(context).size.width/15,
                    ),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width/1.5,
                    child:  TextField(
                      controller: contactController,
                      decoration: InputDecoration(
                        label: const Text("Phone number"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 10
                            )
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: MediaQuery.of(context).size.width/15,
                    ),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width/4,
                    child:  TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        label: const Text("Amount"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 10
                            )
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/6,
                    height: 60,
                    child: GestureDetector(
                      onTap: () {
                        if(contactController.text.isNotEmpty && amountController.text.isNotEmpty){
                        widget.callback(context,
                          false,
                          false,
                          true,
                          false,
                          "${contactController.text}*${amountController.text}#",
                        );
                        }else if(contactController.text.isEmpty && amountController.text.isEmpty){
                          ToastContext toastContext = ToastContext();
                          toastContext.init(context);
                          Toast.show("Please enter the contact and the amount you want to transfer!", duration: 3);
                        }else if(contactController.text.isEmpty){
                          ToastContext toastContext = ToastContext();
                          toastContext.init(context);
                          Toast.show("Please enter the contact!", duration: 2);
                        }else if(amountController.text.isEmpty){
                          ToastContext toastContext = ToastContext();
                          toastContext.init(context);
                          Toast.show("Please enter an amount!", duration: 2);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(36, 255, 0, 0),
                        ),
                        child: const Icon(
                          Icons.send,
                          size: 50,
                          color: Colors.green,
                          )
                        ),
                    ),
                  ),
                )  
              ],
            ),
          ],
        ),
      );
  }
}
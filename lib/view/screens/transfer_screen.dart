import 'package:flutter/material.dart';
import 'package:safaritel/controller/format_phone_number.dart';
import 'package:safaritel/controller/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safaritel/view/widgets/choose_network.dart';
import 'package:toast/toast.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({
    super.key,
  });
  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  TextEditingController contactController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Contact? contact;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 247, 226),
      appBar: AppBar(
        title: const Text(
          "Transfer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3,
                  left: MediaQuery.of(context).size.width / 15,
                ),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: Stack(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: contactController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              label: const Text("Phone number"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 10))),
                        ),
                      ),
                      Positioned(
                        right: MediaQuery.of(context).size.width / 100,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 50),
                          child: IconButton(
                            icon: const Icon(Icons.person),
                            color: Colors.green,
                            iconSize: 40,
                            onPressed: () async {
                              if (await isContactPermissionGranted()) {
                                contact =
                                    await FlutterContacts.openExternalPick();
                                // if(contact!.phones.length > 1){
                                //   // ignore: use_build_context_synchronously
                                //   selectNumber(contact!.phones, context, contact!.photo);
                                // }else{
                                contactController.text = formatPhoneNumber(
                                    contact!.phones.first.number);
                                // }
                              }
                            },
                          ),
                        ),
                      )
                    ],
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
                  left: MediaQuery.of(context).size.width / 15,
                ),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 4,
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: const Text("Amount"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.green, width: 10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      if (contactController.text.isNotEmpty &&
                          amountController.text.isNotEmpty) {
                        ChooseNetworkDialog(
                          toTransfer: true,
                          number:
                              "${contactController.text}*${amountController.text}#",
                        );
                      } else if (contactController.text.isEmpty &&
                          amountController.text.isEmpty) {
                        ToastContext toastContext = ToastContext();
                        toastContext.init(context);
                        Toast.show(
                            "Please enter the contact and the amount you want to transfer!",
                            duration: 3);
                      } else if (contactController.text.isEmpty) {
                        ToastContext toastContext = ToastContext();
                        toastContext.init(context);
                        Toast.show("Please enter the contact phone number!",
                            duration: 2);
                      } else if (amountController.text.isEmpty) {
                        ToastContext toastContext = ToastContext();
                        toastContext.init(context);
                        Toast.show("Please enter an amount!", duration: 2);
                      }
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(35, 17, 255, 0),
                        ),
                        child: const Icon(
                          Icons.send,
                          size: 50,
                          color: Colors.green,
                        )),
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

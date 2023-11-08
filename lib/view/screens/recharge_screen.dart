import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class RechargeScreen extends StatefulWidget {
  final dynamic callback;
  const RechargeScreen({
      required this.callback,
      super.key,
    }
    );

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  @override
  Widget build(BuildContext context,) {
    TextEditingController controller = TextEditingController();
    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 229, 247, 226),
        body: Row(
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
                  keyboardType: TextInputType.number,
                  controller: controller,
                  decoration: InputDecoration(
                    label: const Text("Voucher hidden number"),
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
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height/3,
                ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/6,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    if(controller.text.isNotEmpty){
                      widget.callback(false, true, false, false, controller.text);
                    }else if(controller.text.isEmpty){
                      ToastContext toastContext = ToastContext();
                      toastContext.init(context);
                      Toast.show("Please enter the voucher hidden number", duration: 2);
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
                      )
                    ),
                ),
            ))
          ],
        ),
      );
  }
}
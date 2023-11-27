import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safaritel/controller/format_phone_number.dart';
import 'package:safaritel/controller/permission_handler.dart';
import 'package:safaritel/view/widgets/choose_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallmeScreen extends StatefulWidget {
  const CallmeScreen({
    super.key,
  });

  @override
  State<CallmeScreen> createState() => _CallmeScreenState();
}

class _CallmeScreenState extends State<CallmeScreen> {
  TextEditingController controller = TextEditingController();
  late String? number1;

  Future<void> loadNumbers() async {
    final prefs = await SharedPreferences.getInstance();
    number1 = prefs.getString('first');
    controller.text = number1 ?? " ";
  }

  Future<void> setPhoneNumber(String number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('first', number);
  }

  @override
  void initState() {
    super.initState();
    loadNumbers();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    Contact? contact;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 247, 226),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          "Request call me back",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Row(
          children: [
            Stack(children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      label: const Text("Phone number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 1.5 - 50,
                child: Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 50),
                  child: IconButton(
                    icon: const Icon(Icons.person),
                    color: Colors.green,
                    iconSize: 40,
                    onPressed: () async {
                      if (await isContactPermissionGranted()) {
                        contact = await FlutterContacts.openExternalPick();
                        // if(contact!.phones.length > 1){
                        //   // ignore: use_build_context_synchronously
                        //   selectNumber(contact!.phones, context, contact!.photo);
                        // }else{
                        var pickedNumber =
                            formatPhoneNumber(contact!.phones.first.number);
                        controller.text = pickedNumber;
                        setPhoneNumber(pickedNumber);
                        // }
                      }
                    },
                  ),
                ),
              ),
            ]),
            SizedBox(
              width: MediaQuery.of(context).size.width / 6,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  ChooseNetworkDialog(
                      toReqCallMeBack: true, number: controller.text);
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
          ],
        ),
      ),
    );
  }
}

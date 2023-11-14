import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safaritel/controller/format_phone_number.dart';
import 'package:safaritel/controller/permission_handler.dart';

class CallmeScreen extends StatefulWidget {
  final dynamic callback;
  const CallmeScreen({
      required this.callback,
      super.key,
    }
  );

  @override
  State<CallmeScreen> createState() => _CallmeScreenState();
}

class _CallmeScreenState extends State<CallmeScreen> {
  @override
  Widget build(BuildContext context,) {
    TextEditingController controller = TextEditingController();
    Contact? contact;
    return  Scaffold(
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
            Stack(
              children:[ 
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 60,
                  width: MediaQuery.of(context).size.width/1.5,
                  child:  TextField(
                    controller: controller,
                    autofocus: true,
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
                Positioned(
                  left: MediaQuery.of(context).size.width/1.5 - 50,
                  child: Container(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 50),
                    child:  IconButton(
                      icon: const Icon(Icons.person),
                      color: Colors.green,
                      iconSize: 40, 
                      onPressed: () async{ 
                        if(await isContactPermissionGranted()){
                          contact = await FlutterContacts.openExternalPick();
                          // if(contact!.phones.length > 1){
                          //   // ignore: use_build_context_synchronously
                          //   selectNumber(contact!.phones, context, contact!.photo);
                          // }else{
                          controller.text = formatPhoneNumber(contact!.phones.first.number);
                          // }
                        }
                      },
                    ),
                  ),
                ),
              ]
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/6,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  widget.callback(context, false, false, false, true, controller.text);
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
            )
          ],
        ),
      ),
    );
  }
}
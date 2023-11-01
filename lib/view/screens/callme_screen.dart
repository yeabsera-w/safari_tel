import 'package:flutter/material.dart';

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
    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 255, 243),
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
                  controller: controller,
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
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height/3,
                ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/6,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    widget.callback(false, false, false, true, controller.text);
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
            ))
          ],
        ),
      );
  }
}
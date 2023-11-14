import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safaritel/controller/format_phone_number.dart';

selectNumber(List<Phone> phoneNumbers, BuildContext context, Uint8List? photoData)async{
  return showDialog(context: context, builder: (BuildContext context){
    return  AlertDialog(
      title: const Text("We have found more than one phone number of the contact picked",
        style: TextStyle(
          fontSize: 11,
        ),),
      content: SizedBox(
        height: 55.0 * phoneNumbers.length,
        width: 50,
        child: ListView.builder(
            itemCount: phoneNumbers.length,
            itemBuilder: ((BuildContext context, index) {
            return ListTile(
              leading: GestureDetector(
                onTap: ()=>formatPhoneNumber(phoneNumbers[index].number),
                child: const ClipOval(
                    child: Icon(Icons.person,
                    )
                  ),
              ),
              title: Text(formatPhoneNumber(phoneNumbers[index].number)),
            );
          })),
      ),
      );
  });
}
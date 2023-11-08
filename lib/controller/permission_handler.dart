import 'package:permission_handler/permission_handler.dart';
Future<bool> isCallPermissionGranted() async{
  return await Permission.phone.request().isGranted;
}
Future<bool> isContactPermissionGranted() async{
  return await Permission.contacts.request().isGranted;
}
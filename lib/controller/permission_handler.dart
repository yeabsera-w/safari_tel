import 'package:permission_handler/permission_handler.dart';
Future<bool> isPermissionGranted() async{
  return await Permission.phone.request().isGranted;
}
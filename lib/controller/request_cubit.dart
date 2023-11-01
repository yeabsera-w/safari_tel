import 'package:bloc/bloc.dart';
import '../../controller/ussd_request.dart';
import 'package:ussd_advanced/ussd_advanced.dart';
USSDCubit cubit = USSDCubit();
Future<void> normalUSSDRequest(String code) async{
    UssdAdvanced.sendUssd(code: code);
  }
class USSDCubit extends Cubit<String>{
  final String ethioTelecomCheckBalance = "*804#";
  final String ethioTelecomRecharge = "*805*";
  final String ethioTelecomTransfer = "*806*";
  final String callmeBack = "*807*";
  final String safariCheckBalance = "*704#";
  final String safariRecharge = "*705*";
  final String safariTransfer = "*706*";
  USSDCubit() : super("");
  bool trigger = false;
  
  Future<void> ussdRequest(String code) async{
    if (code == ethioTelecomCheckBalance){
      if(trigger == true){
        emit(await makeRequest(ethioTelecomCheckBalance));
        trigger = false;
      }else if(trigger == false){
        emit(await makeRequest(ethioTelecomCheckBalance) + " ");
        trigger = true;
      }
    }else if(code == safariCheckBalance){
      if(trigger == true){
        emit(await makeRequest(safariCheckBalance));
        trigger = false;
      }else if(trigger == false){
        emit(await makeRequest(safariCheckBalance) + " ");
        trigger = true;
      }
    }else if (code.startsWith(ethioTelecomRecharge)){
      if(trigger == true){
        emit(await makeRequest(code));
        trigger = false;
      }else if(trigger == false){
        emit(await makeRequest(code) + " ");
        trigger = true;
      }
    }else if (code.startsWith(safariRecharge)){
      if(trigger == true){
        emit(await makeRequest(code));
        trigger = false;
      }else if(trigger == false){
        emit(await makeRequest(code) + " ");
        trigger = true;
      }
    }else if (code.startsWith(ethioTelecomTransfer)){
      if(trigger == true){
        emit(await makeRequest(code));
        trigger = false;
      }else if(trigger == false){
        emit(await makeRequest(code) + " ");
        trigger = true;
      }
    }else if (code.startsWith(callmeBack)){
      if(trigger == true){
        emit(await makeRequest(code));
        trigger = false;
      }else if(trigger == false){
        emit(await makeRequest(code) + " ");
        trigger = true;
      }
    }
  }
}
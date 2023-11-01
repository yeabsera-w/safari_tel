import '../../controller/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:safaritel/controller/permission_handler.dart';
import 'package:safaritel/view/screens/callme_screen.dart';
import 'package:safaritel/view/screens/recharge_screen.dart';
import 'package:safaritel/view/screens/transfer_screen.dart';
import '../widgets/choose_network.dart';

class AppScreen extends StatefulWidget{
  const AppScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return AppScreenState();
  }
}
class AppScreenState extends State<AppScreen>{
  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
  makeRequest(String code) async{
    if(await isPermissionGranted()){
      cubit.ussdRequest(code);
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 255, 243),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    chooseNet(
                      context,
                      true,
                      false,
                      false,
                      false,
                      ":)"
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(36, 255, 0, 0)),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("lib/images/check_balance.png")
                      ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context)=>  const RechargeScreen(callback: chooseNet,)
                      )
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color:Color.fromARGB(36, 255, 0, 0)),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("lib/images/recharge.png")
                      ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder:(context) => const TransferScreen(callback: chooseNet,))
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(36, 255, 0, 0),
                    ),
                    child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Image.asset("lib/images/transfer.png")
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const CallmeScreen(callback: chooseNet,))
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(36, 255, 0, 0)
                    ),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("lib/images/call_me_back.png")
                      ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
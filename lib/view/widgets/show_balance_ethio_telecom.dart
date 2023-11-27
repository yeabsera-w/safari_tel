import 'package:flutter/material.dart';
import 'package:safaritel/view/widgets/loading.dart';
import '../../controller/request_cubit.dart';

class EthioTelShowBalance extends StatelessWidget {
  const EthioTelShowBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(146, 0, 0, 0),
      content: SizedBox(
        height: 200,
        width: 300,
        child: StreamBuilder(
            stream: cubit.stream,
            builder: (context, snapshot) {
              const loading = SizedBox(height: 150, child: Loading());
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return loading;
                case ConnectionState.waiting:
                  return loading;
                case ConnectionState.active:
                  debugPrint(snapshot.data);
                  return SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (snapshot.data!.contains("ውድ ደንበኛ"))
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "ቀሪ ሂሳብ: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.substring(
                                        20, snapshot.data!.indexOf("ብር")),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text(
                                    "የሚያበቃበት ቀን ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.substring(
                                        snapshot.data!
                                                .indexOf("አገልግሎቱ የሚቋረጠው በ") +
                                            15,
                                        snapshot.data!
                                            .indexOf("ነዉ:: ኢትዮ ቴሌኮም")),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        if (snapshot.data!.contains("Kabajamoo"))
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Balance: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.substring(
                                        51, snapshot.data!.indexOf(". Haftee")),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Expire Date: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.substring(
                                        snapshot.data!
                                                .indexOf("raawwatu guyyaa") +
                                            15,
                                        snapshot.data!.indexOf(" tti dha.")),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        if (snapshot.data!.contains("Dear customer"))
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Balance: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    snapshot.data!.substring(
                                        39, snapshot.data!.indexOf("Birr")),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text(
                                    "Expire Date: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    snapshot.data!.substring(
                                        snapshot.data!
                                                .indexOf("will expire on") +
                                            15,
                                        snapshot.data!
                                            .indexOf(". ethio telecom")),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        if (snapshot.data!.contains(
                            "Dear Customer, operation failed, please try again or contact the contact center.ethio telecom"))
                          const Center(
                            child: Text(
                              "Please Try again later \nor make sure your SIM card is working",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                      ],
                    ),
                  );
                case ConnectionState.done:
                  return const SizedBox();
              }
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:safaritel/view/widgets/loading.dart';
import '../../controller/request_cubit.dart';

class ShowBalanceSafari extends StatelessWidget {
  const ShowBalanceSafari({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                  return SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (snapshot.data!.contains("is"))
                                Row(
                                  children: [
                                    const Text(
                                      "Balance: ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data!.substring(
                                          snapshot.data!.indexOf("Br. ") + 4,
                                          snapshot.data!
                                              .indexOf("SMS will be sent")),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              if (snapshot.data!.contains("ቀሪ"))
                                Row(
                                  children: [
                                    const Text(
                                      "Balance: ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data!.substring(
                                          snapshot.data!.indexOf("ቀሪ ሂሳብዎ") + 7,
                                          snapshot.data!.indexOf("ብር")),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                            ],
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

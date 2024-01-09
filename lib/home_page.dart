import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex:4,
                child: Container(
                 child: Row(
                   children: [
                     Expanded(
                       flex: 1,
                       child: Container(
                         child: Column(
                           children: [
                             Expanded(
                               flex: 1,
                               child: Container(
                                 color: Colors.green,
                                 width: double.infinity,
                                 child: const Icon(
                                   Icons.widgets,
                                   size: 50,
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                             const SizedBox(height: 10),
                             Expanded(
                               flex: 1,
                               child: Container(
                                 color: Colors.redAccent,
                                 width: double.infinity,
                                 child: const Icon(
                                   Icons.send,
                                   size: 50,
                                   color: Colors.white,
                                 ),
                               )
                             )
                           ],
                         )
                       ),
                     ),
                     const SizedBox(width: 10),
                     Expanded(
                       flex: 1,
                       child: Column(
                         children: [
                           Expanded(
                             flex: 1,
                             child: Container(
                               color: Colors.blueAccent,
                               width: double.infinity,
                               child: const Icon(
                                 Icons.wifi,
                                 size: 50,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                           const SizedBox(height: 10),
                           Expanded(
                             flex: 3,
                             child: Row(
                                children: [
                                 Expanded(
                                   flex:1,
                                   child: Column(
                                     children: [
                                       Expanded(
                                         flex: 2,
                                         child: Container(
                                           color: Colors.yellow,
                                           width: double.infinity,
                                           child: const Icon(
                                             Icons.panorama_wide_angle,
                                             size: 50,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ),
                                       const SizedBox(height: 10),
                                       Expanded(
                                         flex: 1,
                                         child: Container(
                                             color: Colors.red,
                                           width: double.infinity,
                                           child: const Icon(
                                             Icons.bluetooth,
                                             size: 50,
                                             color: Colors.white,
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex:1,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Colors.brown,
                                            width: double.infinity,
                                            child: const Icon(
                                              Icons.map,
                                              size: 50,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              color: Colors.blue,
                                            width: double.infinity,
                                            child: const Icon(
                                              Icons.airline_seat_flat,
                                              size: 50,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                             ),
                           )
                         ],
                       ),
                     )
                   ],
                 ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.pink,
                        height: double.infinity,
                        child: const Icon(
                          Icons.battery_alert,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.purple,
                        height: double.infinity,
                        child: const Icon(
                          Icons.desktop_windows,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: const Icon(
                    Icons.radio,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        ),
      ),
    );
  }
}

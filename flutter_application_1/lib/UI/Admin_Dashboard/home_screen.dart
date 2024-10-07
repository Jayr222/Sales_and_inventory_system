import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color.fromARGB(255, 255, 226, 139),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 226, 139),
        width: double.infinity,
        height: 700,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 560,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 20),
                        child: Container(
                          width: 180,
                          height: 150,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 36, 65),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 10),
                        child: Container(
                          width: 180,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 253, 206),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Container(
                                  child: const Text('Total Inventory Value',
                                      style: TextStyle(fontSize: 17))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 10),
                        child: Container(
                          child: const Text(
                            'Inventory',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 360,
                        height: 108,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 246, 232, 248),
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 360,
                          height: 108,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 253, 206),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Add Stocks button pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 0, 0, 0), // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12), // Button padding
                        ),
                        child: const Text('ADD STOCKS'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

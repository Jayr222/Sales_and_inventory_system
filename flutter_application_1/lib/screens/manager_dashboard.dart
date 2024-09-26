import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({super.key});

  @override
  State<ManagerDashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManagerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom navigation bar that has 4 items 
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 226, 139),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
          child: GNav(
            gap: 8,
            backgroundColor: const Color.fromARGB(255, 255, 226, 139),
            color: Colors.black,
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            tabBorder: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
            padding: const EdgeInsets.all(15.0),
            tabs: const [
              GButton(icon: Icons.home_outlined,
              text: 'Home', backgroundColor: Color.fromARGB(255, 255, 255, 255),),
              GButton(icon: Icons.inventory_2_outlined,
              text: 'Inventory', backgroundColor: Color.fromARGB(255, 255, 255, 255),),
              GButton(icon: Icons.settings,
              text: 'Settings',backgroundColor: Color.fromARGB(255, 255, 255, 255),),
              GButton(icon: Icons.account_circle_rounded,
              text: 'Account',backgroundColor: Color.fromARGB(255, 255, 255, 255),),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 226, 139),
        title: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('MANAGER DASHBOARD', 
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold, fontSize: 15,),
          ),
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: IconButton( 
            icon: const Icon (Icons.circle_notifications, color: Color.fromARGB(255, 0, 0, 0),
            size: 35,), 
            onPressed: () {
              //adding functionality to the icon button created on the top right side of the appbar
              }
            ),
          ),
        ]
      ),

      body: Container(
        color: const Color.fromARGB(255, 255, 226, 139),
        child: Center(
          //addable contents to background container 
          child: Container( //container color white
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //first container
                        width: 170,
                        height: 165,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 22, 36),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                              child: Container(
                              width: 135,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Center(child: Text('First Container', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                  ),
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Container(
                        //Second container
                        width: 170,
                        height: 165,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 22, 36),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const Center(child: Text('Second Container',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        )),
                      ),
                      const SizedBox(height: 15.0),
                      ],
                    ),
                ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('INVENTORY', style: 
                          TextStyle(color: Colors.black, 
                          fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                        child: Container(
                          width: 360,
                          height: 160,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 22, 36),
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 90.0, top: 25.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text('No. of Items', 
                                      style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0, top: 10.0, left: 20.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                        child: const Text('(Number of Items)', 
                                        style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                          ),
                                        ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45.0 , top: 10.0),
                                    child: Container(alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // functionality onpress
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color.fromARGB(255, 185, 224, 255),
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0 ,vertical: 13.0)
                                          ),
                                        child: const Text('View Stock Value', 
                                        style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                        ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 125,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                        child: Container(
                          width: 360,
                          height: 160,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 22, 36),
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 90.0, top: 25.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text('No. of Items', 
                                      style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0, top: 10.0, left: 20.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                        child: const Text('(Number of Items)', 
                                        style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                          ),
                                        ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45.0 , top: 10.0),
                                    child: Container(alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // functionality onpress
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color.fromARGB(255, 185, 224, 255),
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0 ,vertical: 13.0)
                                          ),
                                        child: const Text('View Stock Value', 
                                        style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                        ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 125,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                        child: ElevatedButton(
                          onPressed: () {
                            //functionality of bottom elev button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 4, 22, 36), width: 2
                              )
                            )
                          ),
                          child: const Text('Hello',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 22, 36),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ]
            ),
          ),
        ),
        // Row of Container 2

        // inventory message 

        //Container for Item 1

        // Container for Item 2

        )  // Add stock elevated button
    );
  }
}
  

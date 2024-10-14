import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80, // Set the height of the AppBar
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Ensures the container is circular
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 0.9, // Spread of the shadow
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'lib/assets/Shoppingicon.png',
                  ),
                  radius: 25,
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'STAFF DASHBOARD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 44, 62, 80), // You can adjust the size as needed
                ),
              ),
            ],
          ),
        ),
        // Notification Icon
        actions: [
          SizedBox(
            width: 60,
            child: IconButton(
              onPressed: () {},
              icon: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E50),
                  shape: BoxShape.circle, // Rounded corners for circular background
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 35, // Icon size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      //Home Page body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Page Title, Greetings, Container for (Orders,Delivers,Feedback)
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xFF2C3E50),
              ),
              height: 690,
              width: double.infinity,
              //Title Page
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                    const SizedBox(
                      width: 350,
                      child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // Make the TextField transparent
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Search...',
                        border: OutlineInputBorder( 
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ),
                    ),

                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Container Order
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            print('Pressed');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.white.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  offset: Offset(5, 2),
                                )
                              ],
                            ),
                            height: 130,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    'ORDERS',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 60,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Second Container Delivery
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            print('Pressed');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.white.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  offset: Offset(5, 2),
                                )
                              ],
                            ),
                            height: 130,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.fire_truck,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Text(
                                  'DELIVERY',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 50,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Third Container Feedback
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            print('Pressed');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.white.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  offset: Offset(5, 2),
                                )
                              ],
                            ),
                            height: 130,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Text(
                                  'FEEDBACK',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 45,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

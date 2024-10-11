import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              // Adjustment For Textfield SearchBar
              child: SizedBox(
                height: 45,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.5), // Background color of the TextField
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  // Textfield Search Bar/Icon
                  child: const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Colors.transparent, // Make the TextField transparent
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Notification Icon
        actions: [
          SizedBox(
            width: 70,
            child: IconButton(
              onPressed: () {},
              icon: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E50),
                  shape:
                      BoxShape.circle, // Background color, // Rounded corners
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 26, // Icon size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //Home Page body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Page Title, Greetings, Container for (Orders,Delivers,Feedback)
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xFF2C3E50),
              ),
              height: 705,
              width: double.infinity,
              //Title Page
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Staff Dashboard',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                        color: Colors.white,
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
                  const SizedBox(height: 2),
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
                            height: 150,
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
                            height: 160,
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
                            height: 150,
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

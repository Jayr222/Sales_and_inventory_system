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
              const SizedBox(width: 10),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'STAFF DASHBOARD',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                    fontFamily: 'AntonSC',
                    color: Color.fromARGB(255, 44, 62, 80), // You can adjust the size as needed
                  ),
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
                  const SizedBox(height: 20),

                  //Search Box
                  SizedBox(
                    width: 370,
                    height: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(spreadRadius: 2.5),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Color(0xFF2C3E50), 
                          fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          prefixIcon: Icon(
                            Icons.search_off_outlined,
                            color: Color(0xFF2C3E50),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //Greeting, Sub Greetings Title
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome to your Dashboard",
                            style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'NanumGothicCoding', fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Let's make today productive!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'NanumGothicCoding',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  //Three Containers w/ Sections
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 3),

                      //First Container W/ Title
                      Container(
                        width: 370,
                        height: 140,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(spreadRadius: 2)],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'DELIVERY',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 80,
                              color: Color(0xFF2C3E50),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Second Container w/ Section
                      Container(
                        width: 370,
                        height: 140,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(spreadRadius: 2)],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ORDERS',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 80,
                              color: Color(0xFF2C3E50),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Third Container w/ Section
                      Container(
                        width: 370,
                        height: 140,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(spreadRadius: 2)],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'FEEDBACK',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              size: 80,
                              color: Color(0xFF2C3E50),
                            ),
                          ],
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



import 'package:flutter/material.dart';

class ContactInfoField extends StatelessWidget {

  final String label;
  final String value;
  final IconData icon;

  const ContactInfoField({
    super.key,
    required this.label,
    required this.value,
    required this.icon
  });

  @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
              style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 44, 62, 80),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
              enabled: false, // This makes the field read-only
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 157, 157, 157),
                ),
                hintText: value,
                suffixIcon: Icon(icon, color: const Color.fromARGB(255, 44, 62, 80),),
                filled: true,
                fillColor: const Color(0xFFF1F1F1), // Background color for the field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none, // No visible border
                ),
              ),
          ),
            const SizedBox(height: 20),
          ],
        );
      }
    }

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

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
                  'ACCOUNT',
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
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255), // Background color
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 700,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 44, 62, 80), // Inner container color
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 125,
                            height: 125,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: const Offset(0, 3), // shadow direction: bottom right
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15), // Add spacing between profile picture and text
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'USERNAME',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                'MANAGER',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 225, 237),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Username
                          //- USERNAME
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  width: 350,
                                  height: 450,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: ContactInfoField(
                                          label: "Your Username: ", 
                                          value: "sxenogaming06@gmail.com", 
                                          icon: Icons.email,),
                                      ),
                                  
                                      const Divider(thickness: 1, color: Color.fromARGB(255, 44, 62, 80)),
                                  
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: ContactInfoField(
                                          label: "Your Phone Number: ", 
                                          value: "09616060087", 
                                          icon: Icons.phone),
                                      ),
                                  
                                      const Divider(thickness: 1, color: Color.fromARGB(255, 44, 62, 80)),
                                  
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: ContactInfoField(
                                          label: "Your Workplace: ", 
                                          value: "753 int 81 Raxabago Street, Tondo", 
                                          icon: Icons.house),
                                      ),                    
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: MaterialButton(onPressed: () {
                                              print("Heading to Edit Account Screen");
                                            },
                                            color: const Color.fromARGB(255, 44, 62, 80),
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                              side: const BorderSide(color: Colors.black)
                                            ),
                                            child: const Padding(
                                              padding:  EdgeInsets.all(20.0),
                                              child: Text("Edit Account"),
                                            ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ),
                              )
                            ],
                          )
                          //divider
                          //Email
                          //- Email                               
                          //dividera
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
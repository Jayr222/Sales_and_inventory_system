import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.9,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('lib/assets/Shoppingicon.png'),
                  radius: 25,
                ),
              ),
              const SizedBox(width: 10),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'HISTORY',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                    fontFamily: 'AntonSC',
                    color: Color.fromARGB(255, 44, 62, 80),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 60,
            child: IconButton(
              onPressed: () {},
              icon: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E50),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //Main body
      backgroundColor: const Color(0xFF2C3E50),

        //Main body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // First Container
                    Container(
                      width: 190,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            spreadRadius: 1.5,
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DATA',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Icon(Icons.arrow_drop_up),
                          ],
                        ),
                      ),
                    ),
                    // Second Container
                    Container(
                      width: 190,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            spreadRadius: 1.5,
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DATA',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Icon(Icons.arrow_drop_down,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Transaction Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NanumGothicCoding',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_list,
                              size: 35,
                            ),
                            Text(
                              'Filter',
                              style: TextStyle(color: Color(0xFF2C3E50), fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 2, color: Colors.white),
              ],
            ),

            const SizedBox(height: 10),

            // Main Container for Transaction History
            Center(
              child: Container(
                width: 380,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: List.generate(10, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Transaction ${index + 1}')),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

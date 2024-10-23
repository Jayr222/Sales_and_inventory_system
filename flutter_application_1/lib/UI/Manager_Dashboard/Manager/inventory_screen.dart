import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});
  
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  List<Widget> containerList = [];
  List<int> amounts = [];

  // Function for adding the containers
  void addContainer(String name, String description, int amount) {
    setState(() {
      amounts.add(amount); // Store the initial amount for the item

      containerList.add(
        StatefulBuilder(builder: (context, setStateContainer) {
          return Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ), 
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'ITEM: $name',  // Use name inputted
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 44, 62, 80),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setStateContainer(() {
                                      if (amounts[containerList.indexOf(containerList.last)] > 0) {
                                        amounts[containerList.indexOf(containerList.last)]--;  // Decrement amount
                                      }
                                    });
                                  }, 
                                  icon: const Icon(Icons.remove, color: Color.fromARGB(255, 44, 62, 80)),
                                ),
                                
                                IconButton(
                                  onPressed: () {
                                    setStateContainer(() {
                                      amounts[containerList.indexOf(containerList.last)]++;  // Increment amount
                                    });
                                  }, 
                                  icon: const Icon(Icons.add, color: Color.fromARGB(255, 44, 62, 80)),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        deleteContainer(containerList.indexOf(containerList.last));
                                      });
                                    }, 
                                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 44, 62, 80)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 100),
                      child: Row(
                        children: [
                          Text(
                            'Amount: ${amounts[containerList.indexOf(containerList.last)]}',  // Display updated amount
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 62, 80),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDescriptionDialog(description);
                      }, 
                      icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 44, 62, 80)),
                    )
                  ],
                ),
              ],
            ),
          );
        }),
      );
    });
  }

  void deleteContainer(int index) {
    setState(() {
      containerList.removeAt(index);
      amounts.removeAt(index);  // Remove amount for deleted container
    });
  }

  void _showDescriptionDialog(String description) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Product Description",
          style: TextStyle(
            color: Color.fromARGB(255, 44, 62, 80),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: Container(
          constraints: const BoxConstraints(
            maxHeight: 300,  // Adjust height
            maxWidth: 400,   // Adjust width
          ),
          padding: const EdgeInsets.all(20),  // Adjust padding inside the dialog
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15), // Add border radius if needed
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,  // Ensures the dialog doesn't exceed content size
              children: [
                // You can add more custom widgets here
                const Icon(Icons.description, size: 50, color: Color.fromARGB(255, 44, 62, 80)),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 44, 62, 80),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
            
                Container(
                  child: Text("Amount ${amounts}", 
                  style: const TextStyle(
                    color: Color.fromARGB(255, 44, 62, 80),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 44, 62, 80), // Button color
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();  // Close dialog on button press
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


  // Function for the alert dialogue to add new item
  void _showAddDialog() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Add Your Item",
            style: TextStyle(color: Color.fromARGB(255, 44, 62, 80)),
          ),
          content: Container(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name input field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name of Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Description input field
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description of Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Amount input field
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount of Item',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Clear fields after pressing cancel
                _nameController.clear();
                _descriptionController.clear();
                _amountController.clear();
              },
              child: const Text("Cancel", style: TextStyle(color: Color.fromARGB(255, 44, 62, 80))),
            ),
            TextButton(
              onPressed: () {
                // Get values from input strings
                String name = _nameController.text;
                String description = _descriptionController.text;
                int amount = int.tryParse(_amountController.text) ?? 0;  // Convert amount to integer

                addContainer(name, description, amount);

                // Clear the text fields
                _nameController.clear();
                _descriptionController.clear();
                _amountController.clear();

                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 62, 80),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Image.asset(
            'lib/assets/Shoppingicon.png',
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'INVENTORY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 44, 62, 80),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.circle_notifications, color: Color.fromARGB(255, 44, 62, 80), size: 35),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: containerList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _showAddDialog,
        child: const Icon(Icons.add, color: Color.fromARGB(255, 44, 62, 80)),
      ),
    );
  }
}

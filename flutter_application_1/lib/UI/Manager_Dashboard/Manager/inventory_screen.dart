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

  void addContainer(String name, String description, int amount) {
    setState(() {
      amounts.add(amount);

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
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'ITEM: $name', // Use name inputted
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
                                      if (amounts[containerList
                                              .indexOf(containerList.last)] >
                                          0) {
                                        amounts[containerList.indexOf(
                                            containerList
                                                .last)]--; // Decrement amount
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove,
                                      color: Color.fromARGB(255, 44, 62, 80)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setStateContainer(() {
                                      amounts[containerList.indexOf(
                                          containerList
                                              .last)]++; // Increment amount
                                    });
                                  },
                                  icon: const Icon(Icons.add,
                                      color: Color.fromARGB(255, 44, 62, 80)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        deleteContainer(containerList
                                            .indexOf(containerList.last));
                                      });
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Color.fromARGB(255, 44, 62, 80)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    sellItem(name);
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.green,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 100),
                      child: Row(children: [
                        Text(
                          'Amount: ${amounts[containerList.indexOf(containerList.last)]}', // Display updated amount
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 62, 80),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDescriptionDialog(description);
                      },
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 44, 62, 80)),
                    ),
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
      amounts.removeAt(index);
    });
  }

  void sellItem(String name) {
    // Find the index of the item in the inventory
    int index = containerList.indexWhere((container) {
      // Identify the item based on name (or any other unique property)
      return container.toString().contains(name);
    });

    if (index != -1) {
      // Decrease the amount of the item
      setState(() {
        if (amounts[index] > 0) {
          amounts[index]--;
        }
      });
    }
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
              maxHeight: 300,
              maxWidth: 400,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.description,
                      size: 50, color: Color.fromARGB(255, 44, 62, 80)),
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
                    child: Text(
                      "Amount $amounts",
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
                      backgroundColor:
                          const Color.fromARGB(255, 44, 62, 80), // Button color
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
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
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name of Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description of Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
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

                _nameController.clear();
                _descriptionController.clear();
                _amountController.clear();
              },
              child: const Text("Cancel",
                  style: TextStyle(color: Color.fromARGB(255, 44, 62, 80))),
            ),
            TextButton(
              onPressed: () {
                String name = _nameController.text;
                String description = _descriptionController.text;
                int amount = int.tryParse(_amountController.text) ?? 0;

                if (name.isNotEmpty && description.isNotEmpty) {
                  addContainer(name, description, amount);
                  Navigator.of(context).pop();

                  _nameController.clear();
                  _descriptionController.clear();
                  _amountController.clear();
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Color.fromARGB(255, 44, 62, 80)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 62, 80),
        title: const Text("Inventory"),
        actions: [
          IconButton(
            onPressed: () {
              _showAddDialog();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: containerList,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddMedicineScreen extends StatelessWidget {
  AddMedicineScreen({Key? key}) : super(key: key);

  final List<String> compartments = ['1', '2', '3', '4', '5', '6'];
  final List<Color> colors = [
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.blue
  ];
  final List<String> types = ['Tablet', 'Capsule', 'Cream', 'Liquid'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('Add Medicines', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
          decoration: BoxDecoration(
          color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(25.0), // Rounded corners
            border: Border.all(color: Colors.grey[300]!), // Subtle border
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Medicine Name',
              hintStyle: TextStyle(color: Colors.grey[500]), // Hint text color
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]), // Search icon
              suffixIcon: Icon(Icons.mic, color: Colors.grey[500]), // Microphone icon
              border: InputBorder.none, // Remove default TextField border
              contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0), // Adjust padding
            ),
          ),
        ),
              const SizedBox(height: 16),
              const Text('Compartment'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: compartments
                    .map((compartment) => CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Text(compartment),
                ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              const Text('Colour'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: colors
                    .map((color) => CircleAvatar(
                  backgroundColor: color,
                ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              const Text('Type'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: types
                    .map((type) => Column(
                  children: [
                    Icon(Icons.medical_services, size: 32, color: Colors.pink),
                    const SizedBox(height: 4),
                    Text(type),
                  ],
                ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              const Text('Quantity'),
              const SizedBox(height: 8),
              Row(
                children: [
                   Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Take 1/2 Pill',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.blue),
                        ),
                        minimumSize: const Size(30, 48), // Set a minimum size for the button
                      ),

                      child: const Icon(Icons.remove)),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.blue),
                        ),
                        minimumSize: const Size(30, 48), // Set a minimum size for the button
                      ),
                      child: const Icon(Icons.add)),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Total Count'),
              Slider(value: 1, min: 1, max: 100, onChanged: (value) {}),
              const SizedBox(height: 16),
              const Text('Set Date'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: const Text('Today'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: const Text('End Date'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Frequency of Days'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(value: 'Everyday', child: Text('Everyday')),
                      DropdownMenuItem(value: 'Alternate Days', child: Text('Alternate Days')),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Select Frequency'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('How many times a Day'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(value: 'Three Time', child: Text('Three Time')),
                      DropdownMenuItem(value: 'Two Time', child: Text('Two Time')),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Select Times'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Doses'),
              const SizedBox(height: 8),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Dose 1'),
                    trailing: const Text('Before Food'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Dose 2'),
                    trailing: const Text('After Food'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Dose 3'),
                    trailing: const Text('Before Sleep'),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                      ),
                      child: const Text('Before Food',style: TextStyle(fontSize: 11),),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                      ),
                      child: const Text('After Food',style: TextStyle(fontSize: 11),),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                      ),
                      child: const Text('Before Sleep',style: TextStyle(fontSize: 11),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


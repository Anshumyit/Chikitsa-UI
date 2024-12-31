import 'package:flutter/material.dart';
import 'package:flutterassigment/view/Addmedicin.dart';
import 'package:hexcolor/hexcolor.dart';

class MedicineScreen extends StatefulWidget {
  @override
  State<MedicineScreen> createState() => _MedicineState();
}

class _MedicineState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildDateSelector(),
          Divider(color: Colors.grey[300], thickness: 1),
          Expanded(child: _buildMedicineSections()),
        ],
      ),

    );
  }

  // AppBar Implementation
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Harry!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  '5 Medicines Left',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.blue, size: 28),
            onPressed: () {
              // Profile or add action
            },
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('images/capsimage.jpg'), // Replace with actual asset image
          ),
        ],
      ),
    );
  }

  // Date Selector Implementation
  Widget _buildDateSelector() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDateTile('Thu'),
          _buildDateTile('Fri'),
          _buildDateTile('Saturday, Sep 3', isSelected: true),
          _buildDateTile('Sun'),
          _buildDateTile('Mon'),
        ],
      ),
    );
  }

  Widget _buildDateTile(String day, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Medicine Sections Implementation
  Widget _buildMedicineSections() {
    return ListView(
      children: [
        _buildMedicineSection('Morning 08:00 am', [
          _buildMedicineCard('Calpol 500mg Tablet', 'Before Breakfast', 'Day 01', 'Taken', Colors.green),
          _buildMedicineCar('Calpol 500mg Tablet', 'Before Breakfast', 'Day 27', 'Missed', Colors.red),
        ]),
        _buildMedicineSection('Afternoon 02:00 pm', [
          _buildMedicineCard('Calpol 500mg Tablet', 'After Food', 'Day 01', 'Snoozed', Colors.orange),
        ]),
        _buildMedicineSection('Night 09:00 pm', [
          _buildMedicineCa('Calpol 500mg Tablet', 'Before Sleep', 'Day 03', 'Left', Colors.grey),
        ]),
      ],
    );
  }

  Widget _buildMedicineSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ...cards,
      ],
    );
  }

  Widget _buildMedicineCard(String medName, String instruction, String day, String status, Color statusColor) {
    return Card(
      color: HexColor('#f6f8ff'),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset('images/meimage.png',height: 40,),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(medName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(instruction, style: TextStyle(color: Colors.grey[600])),
                  Text(day, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.notifications, color: statusColor, size: 24),
                Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMedicineCar(String medName, String instruction, String day, String status, Color statusColor) {
    return Card(
      color: HexColor('#f6f8ff'),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset('images/circle12.png',height: 40,),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(medName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(instruction, style: TextStyle(color: Colors.grey[600])),
                  Text(day, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.notifications, color: statusColor, size: 24),
                Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMedicineCa(String medName, String instruction, String day, String status, Color statusColor) {
    return Card(
      color: HexColor('#f6f8ff'),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset('images/injection.png',height: 40,),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(medName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(instruction, style: TextStyle(color: Colors.grey[600])),
                  Text(day, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.notifications, color: statusColor, size: 24),
                Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






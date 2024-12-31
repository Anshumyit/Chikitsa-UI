import 'package:flutter/material.dart';
import 'package:flutterassigment/view/Addmedicin.dart';
import 'package:flutterassigment/view/Report..dart';
import 'package:flutterassigment/view/homeScreen.dart';

class Medicine extends StatefulWidget {
  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int _currentIndex = 0; // To track the selected tab

  final List<Widget> _screens = [
    MedicineScreen(),
    ReportScreen(),
  ]; // List of screens to keep state alive

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // Show only the selected screen
        children: _screens,
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Floating Action Button Implementation
  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddMedicineScreen()), // Navigate to Add Medicine Screen
        );
      },
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: Colors.black,
      shape: CircleBorder(),
    );
  }

  // Bottom Navigation Bar Implementation
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update selected tab
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Reports',
        ),
      ],
    );
  }
}




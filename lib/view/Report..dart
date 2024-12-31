import 'package:flutter/material.dart';



class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding:  EdgeInsets.only(left: 10),
          child: Text("Report",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today's Report
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.5),
                        child: Text("Today's Report", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReportSummary(label: "Total", count: "5"),
                          ReportSummary(label: "Taken", count: "3"),
                          ReportSummary(label: "Missed", count: "1"),
                          ReportSummary(label: "Snoozed", count: "1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Check Dashboard
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text("Check Dashboard"),
                  subtitle: Text("Here you will find everything related to your active and past medicines."),
                  trailing:  Container(
                    height: 50,
                    width: 50,
                    child: CustomPaint(
                      painter: CircularChartPainter(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Check History
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Check History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DayCircle(day: "SUN", isSelected: true),
                  DayCircle(day: "MON"),
                  DayCircle(day: "TUE"),
                  DayCircle(day: "WED"),
                  DayCircle(day: "THU"),
                  DayCircle(day: "FRI"),
                ],
              ),
              SizedBox(height: 16),
              // Morning Medications
              MedicationSection(
                title: "Morning 08:00 am",
                medications: [
                  MedicationCard(
                    name: "Calpol 500mg Tablet",
                    details: "Before Breakfast  |  Day 01",
                    status: "Taken",
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                  ),
                  MedicationCard(
                    name: "Calpol 500mg Tablet",
                    details: "Before Breakfast  |  Day 27",
                    status: "Missed",
                    icon: Icons.cancel,
                    iconColor: Colors.red,
                  ),
                ],
              ),
              // Afternoon Medications
              MedicationSection(
                title: "Afternoon 02:00 pm",
                medications: [
                  MedicationCard(
                    name: "Calpol 500mg Tablet",
                    details: "After Food  |  Day 01",
                    status: "Snoozed",
                    icon: Icons.notifications_paused,
                    iconColor: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

class ReportSummary extends StatelessWidget {
  final String label;
  final String count;

  ReportSummary({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

class DayCircle extends StatelessWidget {
  final String day;
  final bool isSelected;

  DayCircle({required this.day, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
      child: Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
    );
  }
}

class MedicationSection extends StatelessWidget {
  final String title;
  final List<Widget> medications;

  MedicationSection({required this.title, required this.medications});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ...medications,
        SizedBox(height: 16),
      ],
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String name;
  final String details;
  final String status;
  final IconData icon;
  final Color iconColor;

  MedicationCard({required this.name, required this.details, required this.status, required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple[100],
          child: Icon(Icons.local_pharmacy, color: Colors.purple),
        ),
        title: Text(name),
        subtitle: Text(details),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            Text(status, style: TextStyle(color: iconColor)),
          ],
        ),
      ),
    );
  }
}


class CircularChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Draw the background circle
    paint.color = Colors.grey[200]!;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );

    // Draw the segments
    paint.color = Colors.red;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -0.5,
      1,
      false,
      paint,
    );

    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      0.5,
      1,
      false,
      paint,
    );

    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      1.5,
      1,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

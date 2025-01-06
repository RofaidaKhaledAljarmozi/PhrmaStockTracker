import 'package:flutter/material.dart';
import 'recives from inventory.dart'; // تأكد من استيراد الصفحة الجديدة
import 'recives-returnes.dart'; // تأكد من استيراد صفحة الاستلام من المخازن
import 'distribute_to_pharmacies.dart'; // تأكد من استيراد صفحة التوزيع إلى الصيدليات

class OperationsPage extends StatelessWidget {
  const OperationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),  // Adjust spacing as needed
            const Text(
              "العمليات ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),  // Adjust spacing as needed
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCard(context, Icons.archive, "استلام المردودات"),
                  _buildCard(context, Icons.inventory, "الاستلام من المخازن"),
                  _buildCard(context, Icons.local_shipping, "التوزيع إلى الصيدليات"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "الاستلام من المخازن") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReceiveFromWarehousePage()),
          );
        } else if (title == "استلام المردودات") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecivesReturnsPage()),
          );
        } else if (title == "التوزيع إلى الصيدليات") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DistributeToPharmaciesPage()),
          );
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
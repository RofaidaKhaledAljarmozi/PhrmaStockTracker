import 'package:flutter/material.dart';
import 'AddNewReceiveProcess.dart'; // Import the new page

class ReceiveFromWarehousePage extends StatelessWidget {
  const ReceiveFromWarehousePage({super.key});

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
            const SizedBox(height: 20),
            const Text(
              "عمليات الاستلام من المخازن السابقة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "البحث",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.add, size: 30),
                  onPressed: () {
                    // Navigate to the Add New Receive Process page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddNewReceiveProcessPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildItemCard(context, "1", "12 كرتون", "21/12/2012"),
                  _buildItemCard(context, "2", "15 كرتون", "22/12/2012"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, String number, String quantity, String date) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text("الرقم: $number"),
        subtitle: Text("الكمية: $quantity\nالتاريخ: $date"),
        onTap: () {
          _showDetailsDialog(context, number, quantity, date);
        },
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, String number, String quantity, String date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تفاصيل الادوية المستلمة من المخازن"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DataTable(
                columns: const [
                  DataColumn(label: Text("الرقم")),
                  DataColumn(label: Text("اسم الدواء")),
                  DataColumn(label: Text("الكمية")),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(number)),
                    const DataCell(Text("اسم الدواء مثال")),
                    DataCell(Text(quantity)),
                  ]),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("إغلاق"),
            ),
          ],
        );
      },
    );
  }
}
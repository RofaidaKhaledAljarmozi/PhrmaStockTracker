import 'package:flutter/material.dart';
import 'MedicineDetailPage.dart';

class ExpiredMedicinesPage extends StatelessWidget {
  final String pharmacyName = "صيدلية الأمل";

  const ExpiredMedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أدوية قريبة من الانتهاء"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "الشهر",
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "اجمالي الأدوية قريبة الانتهاء: 3",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMedicineCard(context, "ادويلان", "12 باكت", "2024-01-15"),
                  _buildMedicineCard(context, "باراسيتامول", "5 باكت", "2024-02-10"),
                  _buildMedicineCard(context, "أموكسيسيلين", "8 باكت", "2024-03-05"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineCard(
      BuildContext context,
      String medicineName,
      String quantity,
      String expiryDate,
      ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicineDetailPage(
                medicineName: medicineName,
                quantity: quantity,
                pharmacyName: pharmacyName,
                expiryDate: expiryDate,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اسم الدواء: $medicineName", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("الكمية: $quantity", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("تاريخ الانتهاء: $expiryDate", style: const TextStyle(fontSize: 16, color: Colors.red)),
                ],
              ),
              const Icon(Icons.info, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

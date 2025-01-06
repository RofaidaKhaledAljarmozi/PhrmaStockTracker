import 'package:flutter/material.dart';
import 'expired-drug.dart'; // تأكد من استيراد صفحة التفاصيل
import 'drug-near-expired.dart'; // استيراد صفحة الأدوية المنتهية

class RecivesReturnsPage extends StatelessWidget {
  const RecivesReturnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "استلام المردودات من الصيدليات",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildCard(context, Icons.warning, "أدوية قريبة الانتهاء", true),
              const SizedBox(height: 32),
              _buildCard(context, Icons.assignment, "أدوية مردودة (منتهية)", false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, bool isNearExpiry) {
    return GestureDetector(
      onTap: () {
        if (isNearExpiry) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const ExpiredMedicinesPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExpiredMedicineNearPage ()), // الانتقال إلى صفحة الأدوية المنتهية
          );
        }
      },
      child: SizedBox(
        width: 300,
        height: 200,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 70, color: Colors.blue),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
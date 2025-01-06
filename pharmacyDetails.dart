import 'package:flutter/material.dart';
import 'EditPharmacyInfo.dart';

class PharmacyDetailPage extends StatelessWidget {
  final String name;
  final String location;
  final String contact;
  final bool isActive;

  const PharmacyDetailPage({
    Key? key,
    required this.name,
    required this.location,
    required this.contact,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الصيدلية"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "الموقع: $location",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              "رقم التواصل: $contact",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 5),
                Text(
                  "حالة الصيدلية: ${isActive ? 'نشطة' : 'غير نشطة'}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(height: 40, thickness: 2),
            const Text(
              "تقارير نشاطها:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // هنا يمكنك إضافة مخطط أو بيانات أخرى
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[50],
                  ),
                  child: const Center(
                    child: Text(
                      "مخطط النشاط هنا",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPharmacyPage(
                name: name,
                location: location,
                contact: contact,
                isActive: isActive,
              ),
            ),
          );
        },
        label: const Text("تعديل", style: TextStyle(fontSize: 16)),
        icon: const Icon(Icons.edit),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
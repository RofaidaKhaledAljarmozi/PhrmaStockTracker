import 'package:flutter/material.dart';

class EditPharmacyPage extends StatelessWidget {
  final String name;
  final String location;
  final String contact;
  final bool isActive;

  const EditPharmacyPage({
    Key? key,
    required this.name,
    required this.location,
    required this.contact,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: name);
    final TextEditingController locationController = TextEditingController(text: location);
    final TextEditingController contactController = TextEditingController(text: contact);

    return Scaffold(
      appBar: AppBar(
        title: const Text("تعديل بيانات الصيدلية"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "اسم الصيدلية",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: "الموقع",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: const InputDecoration(
                labelText: "رقم التواصل",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("حالة الصيدلية: ", style: TextStyle(fontSize: 16)),
                Switch(
                  value: isActive,
                  onChanged: (value) {
                    // قم بإضافة منطق لحفظ الحالة
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // هنا يمكنك إضافة منطق حفظ التعديلات
                Navigator.pop(context);
              },
              child: const Text("حفظ التعديلات"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
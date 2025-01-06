import 'package:flutter/material.dart';

class EditReturnedMedicinePage extends StatelessWidget {
  final String medicineName; // اسم الدواء
  final String pharmacyName;  // اسم الصيدلية
  final String quantity;      // الكمية
  final String returnDate;    // تاريخ الاسترجاع

  const EditReturnedMedicinePage({
    Key? key,
    required this.medicineName,
    required this.pharmacyName,
    required this.quantity,
    required this.returnDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التعديل على بيانات الأدوية المردودة"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("معلومات الدواء", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              Text("اسم الدواء", style: TextStyle(fontSize: 18)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل اسم الدواء",
                ),
                controller: TextEditingController(text: medicineName),
              ),
              const SizedBox(height: 16),

              Text("اسم الصيدلية", style: TextStyle(fontSize: 18)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل اسم الصيدلية",
                ),
                controller: TextEditingController(text: pharmacyName),
              ),
              const SizedBox(height: 16),

              Text("الكمية", style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل الكمية",
                ),
                controller: TextEditingController(text: quantity),
              ),
              const SizedBox(height: 16),

              Text("تاريخ الاسترجاع", style: TextStyle(fontSize: 18)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل تاريخ الاسترجاع (مثال: 01-01-2024)",
                ),
                controller: TextEditingController(text: returnDate),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // منطق حفظ البيانات
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("تم تعديل البيانات بنجاح!")),
                    );
                  },
                  child: Text("تعديل", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
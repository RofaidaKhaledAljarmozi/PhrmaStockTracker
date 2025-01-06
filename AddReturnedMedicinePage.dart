import 'package:flutter/material.dart';

class AddReturnedMedicinePage extends StatelessWidget {
  final Function(String, String, String, String) onAdd; // الدالة تأخذ 4 معاملات

  const AddReturnedMedicinePage({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController medicineController = TextEditingController();
    final TextEditingController pharmacyController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController returnDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة مردود جديد"),
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
                controller: medicineController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل اسم الدواء",
                ),
              ),
              const SizedBox(height: 16),

              Text("اسم الصيدلية", style: TextStyle(fontSize: 18)),
              TextField(
                controller: pharmacyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل اسم الصيدلية",
                ),
              ),
              const SizedBox(height: 16),

              Text("الكمية", style: TextStyle(fontSize: 18)),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل الكمية",
                ),
              ),
              const SizedBox(height: 16),

              Text("تاريخ الاسترجاع", style: TextStyle(fontSize: 18)),
              TextField(
                controller: returnDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "أدخل تاريخ الاسترجاع (مثال: 01-01-2024)",
                ),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // استدعاء الدالة لإضافة المردود
                    onAdd(
                      medicineController.text,
                      pharmacyController.text,
                      quantityController.text,
                      returnDateController.text,
                    );
                    Navigator.pop(context); // العودة إلى الصفحة السابقة
                  },
                  child: Text("إضافة", style: TextStyle(fontSize: 18)),
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
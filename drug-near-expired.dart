import 'package:flutter/material.dart';
import 'EditReturnedMedicinePage.dart';
import 'AddReturnedMedicinePage.dart';

class ExpiredMedicineNearPage extends StatefulWidget {
  const ExpiredMedicineNearPage({super.key});

  @override
  _ExpiredMedicineNearPageState createState() => _ExpiredMedicineNearPageState();
}

class _ExpiredMedicineNearPageState extends State<ExpiredMedicineNearPage> {
  final String pharmacyName = "صيدلية الأمل";
  final List<Map<String, String>> returnedMedicines = [];

  void _addReturnedMedicine(String medicineName, String pharmacyName, String quantity, String returnDate) {
    setState(() {
      returnedMedicines.add({
        'medicineName': medicineName,
        'pharmacyName': pharmacyName,
        'quantity': quantity,
        'returnDate': returnDate,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أدوية مردودة (منتهية)"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "أدخل الشهر (مثال: 01-2024)",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اجمالي المردودات: ${returnedMedicines.length}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddReturnedMedicinePage(onAdd: _addReturnedMedicine), // تمرير الدالة
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("إضافة مردود"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: returnedMedicines.length,
                itemBuilder: (context, index) {
                  final medicine = returnedMedicines[index];
                  return _buildMedicineCard(
                    medicine['medicineName']!,
                    medicine['pharmacyName']!,
                    medicine['quantity']!,
                    medicine['returnDate']!,
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineCard(String medicineName, String pharmacyName, String quantity, String returnDate, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("اسم الصيدلية: $pharmacyName", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("اسم الدواء: $medicineName", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("الكمية: $quantity", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("تاريخ الاسترجاع: $returnDate", style: const TextStyle(fontSize: 16)),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditReturnedMedicinePage(
                      medicineName: medicineName,
                      pharmacyName: pharmacyName,
                      quantity: quantity,
                      returnDate: returnDate,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'ConvertDrug.dart'; // استيراد صفحة النقل

class MedicineDetailPage extends StatefulWidget {
  final String medicineName;
  final String quantity;
  final String pharmacyName;
  final String expiryDate;

  const MedicineDetailPage({
    Key? key,
    required this.medicineName,
    required this.quantity,
    required this.pharmacyName,
    required this.expiryDate,
  }) : super(key: key);

  @override
  _MedicineDetailPageState createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  // قائمة العبوات المتوفرة
  List<Map<String, dynamic>> packageDetails = [
    {"name": "شريط حبوب الضغط", "quantity": 12, "transferred": 0},
    {"name": "علبة مضاد حيوي", "quantity": 200, "transferred": 0},
    {"name": "علبة شراب مضاد الحلق", "quantity": 40, "transferred": 0},
  ];

  // دالة للانتقال إلى صفحة النقل
  void _navigateToTransferPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransferPage(
          medicineName: packageDetails[index]["name"],
          pharmacyName: widget.pharmacyName,
          quantity: packageDetails[index]["quantity"].toString(),
        ), // الانتقال إلى صفحة النقل
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل الدواء"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "اسم الدواء: ${widget.medicineName}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "اسم الصيدلية: ${widget.pharmacyName}",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              "تاريخ انتهاء الدواء: ${widget.expiryDate}",
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const Divider(height: 40, thickness: 2),
            const Text(
              "تفاصيل العبوات:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: packageDetails.length,
                itemBuilder: (context, index) {
                  final package = packageDetails[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        "${package["name"]} - المتبقي: ${package["quantity"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        "تم نقل: ${package["transferred"]} عبوة",
                        style: const TextStyle(color: Colors.green),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => _navigateToTransferPage(index), // الانتقال للصفحة الجديدة
                        child: const Text("نقل", style: TextStyle(fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("عودة", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

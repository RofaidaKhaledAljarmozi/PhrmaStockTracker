import 'package:flutter/material.dart';

class DistributeToPharmaciesPage extends StatefulWidget {
  const DistributeToPharmaciesPage({Key? key}) : super(key: key);

  @override
  _DistributeToPharmaciesPageState createState() => _DistributeToPharmaciesPageState();
}

class _DistributeToPharmaciesPageState extends State<DistributeToPharmaciesPage> {
  List<Map<String, String>> distributions = [];

  void _addDistribution(String medicationName, String pharmacyName, String quantity, String details) {
    setState(() {
      distributions.add({
        "medication": medicationName,
        "pharmacy": pharmacyName,
        "quantity": quantity,
        "details": details,
      });
    });
  }

  void _showDetails(String details, String medicationName, String pharmacyName, String quantity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          medicationName: medicationName,
          pharmacyName: pharmacyName,
          quantity: quantity,
          details: details,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التوزيع إلى الصيدليات"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _addDistributionDialog(context),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    dataRowHeight: 60,
                    headingRowHeight: 60,
                    columns: const [
                      DataColumn(label: Text("الرقم", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("اسم الدواء", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("الصيدلية", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("الكمية", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("تفاصيل", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                    ],
                    rows: List<DataRow>.generate(
                      distributions.length,
                          (index) => DataRow(cells: [
                        DataCell(Text('${index + 1}')),
                        DataCell(Text(distributions[index]["medication"] ?? "")),
                        DataCell(Text(distributions[index]["pharmacy"] ?? "")),
                        DataCell(Text(distributions[index]["quantity"] ?? "")),
                        DataCell(
                          TextButton(
                            onPressed: () => _showDetails(
                              distributions[index]["details"] ?? "لا توجد تفاصيل",
                              distributions[index]["medication"] ?? "",
                              distributions[index]["pharmacy"] ?? "",
                              distributions[index]["quantity"] ?? "",
                            ),
                            child: const Text("مزيد من التفاصيل"),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _addDistributionDialog(BuildContext context) {
    String? medicationName;
    String? pharmacyName;
    String? quantity;
    String? details;

    return AlertDialog(
      title: const Text("إضافة عملية توزيع"),
      content: SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "اسم الدواء",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  medicationName = value;
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "الصيدلية",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  pharmacyName = value;
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "الكمية",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = value;
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: "التفاصيل",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  details = value;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (medicationName != null && pharmacyName != null && quantity != null && details != null) {
              _addDistribution(medicationName!, pharmacyName!, quantity!, details!);
              Navigator.pop(context);
            }
          },
          child: const Text("إضافة"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("إلغاء"),
        ),
      ],
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String medicationName;
  final String pharmacyName;
  final String quantity;
  final String details;

  const DetailsPage({
    Key? key,
    required this.medicationName,
    required this.pharmacyName,
    required this.quantity,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل التوزيع"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "تفاصيل التوزيع إلى الصيدليات",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("اسم الدواء: $medicationName"),
            Text("الصيدلية: $pharmacyName"),
            Text("الكمية: $quantity"),
            const SizedBox(height: 20),
            const Text("تفاصيل إضافية:", style: TextStyle(fontSize: 18)),
            Text(details),
            const SizedBox(height: 20),
            const Text("الإحصائيات التي تم توزيعها:", style: TextStyle(fontSize: 18)),
            const Text("200 ملجرام جوب الضغط"),
            const Text("100 ملجرام مرهم مضاد قطرات"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("عودة"),
            ),
          ],
        ),
      ),
    );
  }
}
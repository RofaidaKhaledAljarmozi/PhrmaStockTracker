import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'recives from inventory.dart'; // تأكد من استيراد صفحة الاستلام من المخازن

class AddNewReceiveProcessPage extends StatefulWidget {
  const AddNewReceiveProcessPage({super.key});

  @override
  _AddNewReceiveProcessPageState createState() => _AddNewReceiveProcessPageState();
}

class _AddNewReceiveProcessPageState extends State<AddNewReceiveProcessPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // تعيين التاريخ الحالي عند بدء الصفحة
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("إضافة دفعة استلام جديدة"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "إضافة دفعة استلام جديدة",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("الاسم", TextInputType.text),
              const SizedBox(height: 16),
              _buildDateField(),
              const SizedBox(height: 16),
              _buildTextField("كمية الدفعة", TextInputType.number),
              const SizedBox(height: 16),
              _buildTextField("كمية الدواء", TextInputType.number),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى صفحة الاستلام من المخازن
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReceiveFromWarehousePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), backgroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text("إضافة"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextInputType keyboardType) {
    return Card(
      elevation: 2,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Card(
      elevation: 2,
      child: TextField(
        controller: _dateController,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: "التاريخ",
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            setState(() {
              _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
            });
          }
        },
      ),
    );
  }
}
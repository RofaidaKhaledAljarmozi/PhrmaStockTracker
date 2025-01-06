import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  final String medicineName;
  final String pharmacyName;
  final String quantity;

  const TransferPage({
    Key? key,
    required this.medicineName,
    required this.pharmacyName,
    required this.quantity,
  }) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  // عناصر اختيار الصيدلية الوجهة
  String? _selectedPharmacy;
  final List<String> pharmacies = ["صيدلية الفجر", "صيدلية المستقبل", "صيدلية الحياة"];

  // متغير للتحقق من الكمية المدخلة
  final TextEditingController _quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // مفتاح التحقق من صحة النموذج
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _quantityController.text = widget.quantity;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  // دالة لتحويل النص إلى عدد صحيح
  int get _transferQuantity => int.tryParse(_quantityController.text) ?? 0;

  // دالة للتحقق من صحة المدخلات
  String? _validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return "الكمية مطلوبة";
    }
    final quantity = int.tryParse(value);
    if (quantity == null || quantity <= 0) {
      return "يرجى إدخال كمية صالحة";
    }
    if (quantity > int.parse(widget.quantity)) {
      return "الكمية المدخلة أكبر من المتاحة";
    }
    return null;
  }

  // دالة لإتمام عملية النقل
  void _transferMedicine() {
    if (_formKey.currentState?.validate() == true && _selectedPharmacy != null) {
      // إذا كانت المدخلات صحيحة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم نقل $_transferQuantity عبوة من ${widget.medicineName} إلى $_selectedPharmacy")),
      );
      Navigator.pop(context); // العودة بعد النقل
    } else {
      setState(() {
        _errorMessage = "يرجى التأكد من صحة المدخلات";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نقل الدواء"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // ربط النموذج بمفتاح التحقق
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
                "الكمية المتاحة: ${widget.quantity}",
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const Divider(height: 40, thickness: 2),
              const Text(
                "اختر صيدلية الوجهة:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                hint: Text("اختر صيدلية الوجهة"),
                value: _selectedPharmacy,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPharmacy = newValue;
                  });
                },
                validator: (value) => value == null ? "يرجى اختيار صيدلية الوجهة" : null,
                items: pharmacies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                "اختر الكمية التي تريد نقلها:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "أدخل الكمية المراد نقلها",
                ),
                validator: _validateQuantity, // التحقق من الكمية
              ),
              const SizedBox(height: 40),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              Center(
                child: ElevatedButton(
                  onPressed: _transferMedicine,
                  child: const Text("نقل", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    backgroundColor: Colors.blueAccent,
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

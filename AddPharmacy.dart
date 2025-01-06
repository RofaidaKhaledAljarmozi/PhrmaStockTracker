import 'package:flutter/material.dart';

class AddPharmacyPage extends StatefulWidget {
  const AddPharmacyPage({super.key});

  @override
  _AddPharmacyPageState createState() => _AddPharmacyPageState();
}

class _AddPharmacyPageState extends State<AddPharmacyPage> {
  final _formKey = GlobalKey<FormState>();
  String? _pharmacyName;
  String? _pharmacyNumber;
  String? _pharmacyAddress;
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30), // زيادة حجم السهم
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("إضافة صيدلية", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text("الاسم", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      hintText: "أدخل اسم الصيدلية",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال اسم الصيدلية';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _pharmacyName = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("الرقم", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      hintText: "أدخل الرقم",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الرقم';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _pharmacyNumber = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("العنوان", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      hintText: "أدخل العنوان",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال العنوان';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _pharmacyAddress = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("الحالة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Switch(
                        value: _isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ), backgroundColor: Colors.white60,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print('اسم الصيدلية: $_pharmacyName');
                          print('الرقم: $_pharmacyNumber');
                          print('العنوان: $_pharmacyAddress');
                          print('الحالة: $_isActive');
                        }
                      },
                      child: const Text("اضافة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
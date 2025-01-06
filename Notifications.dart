import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الاشعارات"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationItem(
              'دواء السكر تمار (Asprin)',
              'صنف حبوب وقوة ينتهي بعد 500 سيف بعد شهرين',
              context,
            ),
            _buildNotificationItem(
              'صيدلية عالم الصيدلة باعت كل الكمية من دواء السكر',
              '',
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String subtitle, BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // هنا يمكنك إضافة منطق حذف الإشعار
            // يمكنك استخدام showDialog لتأكيد الحذف إذا اردت
            _showDeleteConfirmationDialog(context, title);
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تأكيد الحذف"),
          content: Text("هل تريد حذف الإشعار: $title؟"),
          actions: [
            TextButton(
              child: const Text("إلغاء"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("حذف"),
              onPressed: () {
                // هنا يمكنك إضافة منطق الحذف الفعلي
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
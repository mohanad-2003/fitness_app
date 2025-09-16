import 'package:fitness_app/view/notification_setting.dart';
import 'package:fitness_app/view/password_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Color(0xffE2F163),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Setting",
                      style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                _buildListTile(Icons.notifications, "Notification Setting", () {
                  Get.to(NotificationSetting());
                }),
                SizedBox(height: 10),
                _buildListTile(Icons.key, "Password Setting", () {
                  Get.to(PasswordSettings());
                }),
                SizedBox(height: 10),
                _buildListTile(Icons.person, "Delete Account", () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ListTile _buildListTile(IconData icon, String text, VoidCallback? onTap) {
  return ListTile(
    onTap: () {
      if (onTap != null) {
        onTap(); // تأكد من استدعاء onTap عند الضغط
      }
    },
    leading: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff896CFE),
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    ),
    title: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    trailing: Icon(
      Icons.arrow_drop_down_rounded,
      color: Color(0xffE2F163),
      size: 30,
    ),
  );
}

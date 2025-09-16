import 'package:flutter/material.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  // متغيرات منفصلة لكل زر
  bool isGeneralNotificationOn = false;
  bool isSoundOn = false;
  bool isDoNotDisturbOn = false;
  bool isVibrateOn = false;
  bool isLockScreenOn = false;
  bool isRemindersOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xffE2F163),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Notification Setting",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                _buildSwitch(
                  "General Notification",
                  Color(0xffE2F163),
                  isGeneralNotificationOn,
                  (value) {
                    setState(() {
                      isGeneralNotificationOn = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                _buildSwitch("Sound", Color(0xffE2F163), isSoundOn, (value) {
                  setState(() {
                    isSoundOn = value;
                  });
                }),
                SizedBox(height: 10),
                _buildSwitch(
                  "Don’t Disturb Mode",
                  Color(0xffE2F163),
                  isDoNotDisturbOn,
                  (value) {
                    setState(() {
                      isDoNotDisturbOn = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                _buildSwitch("Vibrate", Color(0xffE2F163), isVibrateOn, (
                  value,
                ) {
                  setState(() {
                    isVibrateOn = value;
                  });
                }),
                SizedBox(height: 10),
                _buildSwitch("Lock Screen", Color(0xffE2F163), isLockScreenOn, (
                  value,
                ) {
                  setState(() {
                    isLockScreenOn = value;
                  });
                }),
                SizedBox(height: 10),
                _buildSwitch("Reminders", Color(0xffE2F163), isRemindersOn, (
                  value,
                ) {
                  setState(() {
                    isRemindersOn = value;
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildSwitch(
    String name,
    Color color,
    bool switchValue,
    Function(bool) onChanged,
  ) {
    return Row(
      children: [
        Text(name, style: TextStyle(fontSize: 20, color: Colors.white)),
        Spacer(),
        Transform.scale(
          scale: 0.8, // تغيير الحجم هنا (زيادة أو تقليل الحجم حسب الحاجة)
          child: Switch(
            value: switchValue,
            onChanged: onChanged,
            activeColor: color, // تخصيص اللون عند التفعيل
            inactiveThumbColor: Colors.white, // تخصيص اللون عند عدم التفعيل (الكرة)
            inactiveTrackColor: Color(0xffB3A0FF), // تخصيص اللون عند عدم التفعيل (المسار)
          ),
        ),
      ],
    );
  }
}

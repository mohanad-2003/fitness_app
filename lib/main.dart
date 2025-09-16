import 'package:fitness_app/view/mealIdeaPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ممكن تبقيها 375x812 إذا مصمم الشاشات عندك عليها
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // مرّر الصفحة كـ child حتى ما تنبنى كل مرة
      child: MealIdeaPage(),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // يضمن أخذ قياسات MediaQuery من أعلى شجرة الودجت
          useInheritedMediaQuery: true,
          // (اختياري) ثيم افتراضي بسيط
          // theme: ThemeData(
          //   scaffoldBackgroundColor: const Color(0xff232323),
          //   useMaterial3: true,
          // ),
          // عيّن الـ child كـ home
          home: child,
        );
      },
    );
  }
}

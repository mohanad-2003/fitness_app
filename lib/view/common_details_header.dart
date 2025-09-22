import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDetailsHeader extends StatelessWidget {
  // محتوى رئيسي
  final String name;
  final String time;
  final String calory;
  final String image;

  // شارة أعلى الصورة
  final String tagText;
  final bool showTag;

  // تفعيل النجمة
  final VoidCallback? onStarTap;
  final bool isStarred;

  // ألوان قابلة للتخصيص
  final Color headerBgColor; // خلفية بلوك الصورة
  final Color tagBgColor; // خلفية الشارة
  final Color titleColor; // لون العنوان
  final Color metaIconColor; // لون أيقونات الوقت/السعرات
  final Color metaTextColor; // لون نص الوقت/السعرات

  // أقسام إضافية (اختيارية)
  final List<String>? ingredients; // Ingredients
  final String? preparation; // Preparation
  final EdgeInsetsGeometry padding;

  const CommonDetailsHeader({
    super.key,
    required this.name,
    required this.time,
    required this.calory,
    required this.image,
    this.tagText = "Recipe Of The Day",
    this.showTag = true,
    this.onStarTap,
    this.isStarred = false,
    this.headerBgColor = const Color(0xffB3A0FF),
    this.tagBgColor = const Color(0xffE2F163),
    this.titleColor = const Color(0xffE2F163),
    this.metaIconColor = const Color(0xff896CFE),
    this.metaTextColor = Colors.white,
    this.ingredients,
    this.preparation,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // العنوان + نجمة + ميتاداتا
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اسم الوجبة + نجمة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: titleColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onStarTap,
                    child: Icon(
                      isStarred ? Icons.star : Icons.star_border,
                      // 👇 أحمر لو مفعلة، أبيض لو غير مفعّلة
                      color: isStarred ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // الوقت + السعرات
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/time.png", color: metaIconColor),
                      SizedBox(width: 5.w),
                      Text(
                        time,
                        style: TextStyle(fontSize: 12.sp, color: metaTextColor),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      Image.asset("assets/calories.png", color: metaIconColor),
                      SizedBox(width: 5.w),
                      Text(
                        calory,
                        style: TextStyle(fontSize: 12.sp, color: metaTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        // بلوك الصورة
        Container(
          width: double.infinity,
          height: 242.h,
          decoration: BoxDecoration(
            color: headerBgColor,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    image,
                    width: 323.w,
                    height: 198.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Ingredients (اختياري)
        if (ingredients != null && ingredients!.isNotEmpty) ...[
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                ...ingredients!.map((e) => _bullet(e)),
              ],
            ),
          ),
        ],

        // Preparation (اختياري)
        if (preparation != null && preparation!.trim().isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Preparation",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  preparation!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _bullet(String t) => Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6.w,
          height: 6.w,
          margin: EdgeInsets.only(top: 6.h),
          decoration: const BoxDecoration(
            color: Color(0xff896CFE),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            t,
            style: TextStyle(fontSize: 13.sp, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

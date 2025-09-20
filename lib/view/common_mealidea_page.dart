import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// عنصر واحد في قسم "Recommended"
class RecommendedMealItem {
  final String image;
  final String name;
  final String time;
  final String calory;

  RecommendedMealItem({
    required this.image,
    required this.name,
    required this.time,
    required this.calory,
  });
}

class RecipesMealItem {
  final String name;
  final String image;
  final String time;
  final String calory;

  RecipesMealItem({
    required this.name,
    required this.calory,
    required this.image,
    required this.time,
  });
}

/// صفحة مشتركة/Reusable لقسم فكرة الوجبة + الموصى به
class CommonMealIdeaPage extends StatelessWidget {
  final String image; // صورة البانر
  final String name; // اسم الوصفة في البانر
  final String time; // الوقت في البانر
  final String calories; // السعرات في البانر
  final String tagText; // النص أعلى البانر (افتراضي Recipe of the day)
  final List<RecommendedMealItem> recommendedList;
  final List<RecipesMealItem> recipesList;

  /// ألوان قابلة للتخصيص (اختيارية)
  final Color headerBgColor; // خلفية بلوك البانر الخارجي
  final Color tagBgColor; // خلفية شارة "Recipe of the day"
  final Color accentColor; // لون مميز للنصوص (مثل #E2F163)
  final Color
  secondaryAccentColor; // لون ثانوي للأيقونات الدائرية (مثل #896CFE)

  /// كولباكات اختيارية للتفاعل
  final VoidCallback? onHeaderStarTap;
  final VoidCallback? onHeaderDetails;
  final void Function(int index)? onRecommendedStarTap;
  final void Function(int index)? onRecommendedPlayTap;

  const CommonMealIdeaPage({
    super.key,
    required this.image,
    required this.name,
    required this.calories,
    required this.time,
    required this.recommendedList,
    this.tagText = "Recipe of the day",
    this.headerBgColor = const Color(0xffB3A0FF),
    this.tagBgColor = const Color(0xffE2F163),
    this.accentColor = const Color(0xffE2F163),
    this.secondaryAccentColor = const Color(0xff896CFE),
    this.onHeaderStarTap,
    this.onRecommendedStarTap,
    this.onRecommendedPlayTap,
    required this.recipesList,
    required this.onHeaderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header / Banner
        GestureDetector(
          onTap: onHeaderDetails,
          child: Container(
            width: double.infinity,
            height: 242.h,
            color: headerBgColor,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
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
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 125.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                          ),
                          color: tagBgColor,
                        ),
                        child: Center(
                          child: Text(
                            tagText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff232323),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                          color: Colors.black.withOpacity(0.45),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: accentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: onHeaderStarTap,
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  // time
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/time.png",
                                        color: Colors.white,
                                        width: 16.w,
                                        height: 16.w,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        time,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20.w),
                                  // calories
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/calories.png",
                                        color: Colors.white,
                                        width: 16.w,
                                        height: 16.w,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        calories,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 20.h),

        // Recommended Header
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRecommended(),
              SizedBox(height: 10),
              _buildRecipes(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommended() {
    if (recommendedList.isEmpty) {
      return SizedBox(
        height: 120.h,
        child: Center(
          child: Text(
            "No recommendations yet",
            style: TextStyle(fontSize: 12.sp, color: Colors.white70),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended",
          style: TextStyle(
            fontSize: 20.sp,
            color: accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 210.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedList.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              final item = recommendedList[index];

              return Container(
                width: 180.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صورة البطاقة
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          child: Image.asset(
                            item.image,
                            width: double.infinity,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: InkWell(
                            onTap: () => onRecommendedStarTap?.call(index),
                            child: const Icon(Icons.star, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: -15,
                          right: 10,
                          child: InkWell(
                            onTap: () => onRecommendedPlayTap?.call(index),
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: secondaryAccentColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 22.h),

                    // نصوص البطاقة
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              // time
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/time.png",
                                    color: secondaryAccentColor,
                                    width: 14.w,
                                    height: 14.w,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    item.time,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 14.w),
                              // calories
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/calories.png",
                                    color: secondaryAccentColor,
                                    width: 14.w,
                                    height: 14.w,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    item.calory,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecipes() {
    if (recipesList.isEmpty) {
      return SizedBox(
        height: 120.h,
        child: Center(
          child: Text(
            "No Recipes yet",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recipes For you",
          style: TextStyle(
            fontSize: 20.sp,
            color: Color(0xffE2F163),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 110.h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = recipesList[index];
              return Container(
                width: double.infinity,
                height: 110.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 15.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xff232323),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/time.png",
                                      color: Color(0xff232323),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      item.time,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff212020),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.w),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/calories.png",
                                      color: Color(0xff232323),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      item.calory,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff212020),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              item.image,
                              width: 148.w,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () => "",
                              child: Icon(Icons.star, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(height: 5.h),
            itemCount: recipesList.length,
          ),
        ),
      ],
    );
  }
}

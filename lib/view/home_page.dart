import 'package:fitness_app/controller/homecontroller.dart';
import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
import 'package:fitness_app/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const primaryColor = Color(0xff896CFE);
const accentColor = Color(0xffE2F163);
const backgroundColor = Color(0xff232323);
const textStyle = TextStyle(fontSize: 10, color: Colors.white);

class HomePage extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 5.h),
                    _buildSubheader(),
                    SizedBox(height: 20.h),
                    _buildCategory(
                      homecontroller.categories,
                      homecontroller.scrollController,
                    ),
                    SizedBox(height: 20.h),
                    _buildRecommendationsSection(),
                    SizedBox(height: 20.h),
                    _buildRecommendations(
                      context,
                      homecontroller.recommendations,
                      homecontroller.scrollController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildWeeklyCallenge(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: _buildArticlesTips(
                  context,
                  homecontroller.articlesAndTips,
                  homecontroller.scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticlesTips(
    BuildContext context,
    List<Map<String, String>> articles,
    ScrollController scroll,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Articles & Tips",
          style: TextStyle(color: accentColor, fontSize: 14.sp),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            controller: scroll,
            itemBuilder: (context, index) {
              var article = articles[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          article['image'] ?? "",
                          width: 140.w,
                          height: 134.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => "",
                          child: Icon(Icons.star, color: accentColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 140.w,
                    child: Text(
                      article['description'] ?? "",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: articles.length,
          ),
        ),
      ],
    );
  }

  Container _buildWeeklyCallenge() {
    return Container(
      width: double.infinity,
      color: Color(0xffB3A0FF),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 30.h),
        child: Container(
          height: 160.h,
          decoration: BoxDecoration(
            color: Color(0xff212020),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                child: Column(
                  children: [
                    Text(
                      "Weekly\nChallenge",
                      style: TextStyle(fontSize: 24.sp, color: accentColor),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Plank With Hip Twist",
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    "assets/weekly.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: 200.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "Hi, Madison",
          style: TextStyle(fontSize: 20.sp, color: primaryColor),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Get.to(SearchPage()),
          child: _buildIcon(Icons.search),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () => Get.to(NotificationPage()),
          child: _buildIcon(Icons.notifications),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () => Get.to(ProfilePage()),
          child: _buildIcon(Icons.person),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Icon(icon, color: primaryColor);
  }

  Widget _buildSubheader() {
    return Text(
      "It's time to challenge your limits.",
      style: TextStyle(
        fontSize: 13.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRecommendationsSection() {
    return Row(
      children: [
        Text(
          "Recommendations",
          style: TextStyle(
            fontSize: 15.sp,
            color: accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text("See All", style: TextStyle(color: Colors.white)),
        SizedBox(width: 5.w),
        Icon(Icons.arrow_right, color: accentColor),
      ],
    );
  }

  Widget _buildRecommendations(
    BuildContext context,
    List<Map<String, String>> recommendations,
    ScrollController scroll,
  ) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        controller: scroll,
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          var rec = recommendations[index];
          return _buildRecommendationCard(rec);
        },
      ),
    );
  }

  Widget _buildRecommendationCard(Map<String, String> recommendation) {
    return Container(
      width: 215.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: Image.asset(
                  recommendation['image'] ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 92.h,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.star_purple500_outlined, color: accentColor),
              ),
              Positioned(
                bottom: -15,
                right: 8,
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  recommendation['nameVideo'] ?? "",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.access_time_filled_rounded, color: primaryColor),
                    SizedBox(width: 5.w),
                    Text(recommendation['time_train'] ?? "", style: textStyle),
                    Spacer(),
                    Icon(Icons.fireplace_sharp, color: primaryColor),
                    SizedBox(width: 5.w),
                    Text(recommendation['Kcal'] ?? "", style: textStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
    List<Map<String, String>> categories,
    ScrollController scroll,
  ) {
    return SizedBox(
      height: 88.h,
      child: ListView.separated(
        controller: scroll,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder:
            (context, index) =>
                Container(width: 0.7.w, color: Color(0xffB3A0FF)),
        itemBuilder:
            (context, index) => _buildCategoryCard(categories[index], index),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, String> category, int index) {
    bool isSelected = index == 0;

    return IntrinsicHeight(
      // يجعل ارتفاع البطاقة يعتمد على محتواها
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ارتفاع العمود يعتمد على محتواه
          children: [
            if ((category['image'] ?? "").isNotEmpty)
              Image.asset(category['image']!, width: 40.w, height: 20.h),
            SizedBox(height: 5.h),
            Text(
              category['name'] ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? Color(0xffE2F163) : Color(0xff896CFE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fitness_app/controller/most_popular_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/details_dumple_setup.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendedPage extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  MostPopularController mostPopularController = Get.put(
    MostPopularController(),
  );
  RecommendedPage({
    super.key,
    required this.image,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: HeaderWorkout(name: "Recommendations"),
              ),
              SizedBox(height: 10.h),
              _buildContainerRecommended(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xffE2F163),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _buildGridView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContainerRecommended() {
    return Container(
      width: double.infinity.w,
      color: Color(0xffB3A0FF),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
          child: GestureDetector(
            onTap:
                () => Get.to(
                  DetailsDumpleSetup(image: image, name: name, time: time),
                ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/dum.png",
                    width: double.infinity.w,
                    height: 336.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                      color: Color(0xffE2F163),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "dumbbell step up",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff232323),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 15.w,
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/time.png", color: Colors.white),
                          SizedBox(width: 5.w),
                          Text(
                            "12 Minute",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Image.asset(
                            "assets/calories.png",
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "120 Kcal",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () => "",
                            child: Icon(Icons.star, color: Color(0xffE2F163)),
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
    );
  }

  Widget _buildGridView() {
    return SizedBox(
      height: 600.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 10,
        ),
        itemCount: mostPopularController.mostRecommended.length,
        itemBuilder: (context, index) {
          final item = mostPopularController.mostRecommended[index];
          return Container(
            width: 160.w,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      item['image'] ?? "",
                      width: double.infinity,
                      height: 92.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => "",
                        child: Icon(Icons.star, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: 5,
                      child: Container(
                        width: 25.w,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff896CFE),
                        ),
                        child: Center(
                          child: Icon(Icons.play_arrow, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'] ?? "",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xffE2F163),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/time.png"),
                            color: Color(0xff896CFE),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            item['time'] ?? "",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffE2F163),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/calories.png",
                                  color: Color(0xff896CFE),
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                    item['calory'] ?? "",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xffE2F163),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}

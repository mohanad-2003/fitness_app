import 'package:fitness_app/controller/comunity_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final ComunityController comunityController = Get.put(ComunityController());
  Rx<Map<String, String>?> selectedForum = Rx<Map<String, String>?>(null);
  bool isFavorit = false;

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
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWorkout(name: "Community"),
                    SizedBox(height: 10.h),
                    Obx(() {
                      final current = comunityController.currentCategory.value;
                      return SizedBox(
                        height: 32.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: comunityController.categories.length,
                          separatorBuilder: (c, i) => SizedBox(width: 5.w),
                          itemBuilder: (context, index) {
                            final isSelected = current == index;
                            final item = comunityController.categories[index];
                            return GestureDetector(
                              onTap:
                                  () =>
                                      comunityController.selectCategory(index),
                              child: Container(
                                width: 160.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color:
                                      isSelected
                                          ? Color(0xffE2F163)
                                          : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isSelected
                                              ? Color(0xff232323)
                                              : Color(0xff896CFE),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                if (comunityController.currentCategory.value == 0) {
                  // Category "Discussion Forum"
                  if (selectedForum.value != null) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Forum Details",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xffE2F163),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 500.h,
                            child: ListView.separated(
                              itemBuilder: (contex, index) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffE2F163),
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                      horizontal: 10.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                "assets/profile.png",
                                              ),
                                              radius: 35.r,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              "Madison",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Color(0xffE2F163),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () => "",
                                              child: Icon(
                                                Icons.star_border,
                                                color: Color(0xffE2F163),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          maxLines: 2,
                                          "Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Color(0xffE2F163),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xff896CFE),
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  "30,254",
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Color(0xffE2F163),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.message,
                                                  color: Color(0xff896CFE),
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  "12,254",
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Color(0xffE2F163),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.visibility,
                                                  color: Color(0xff896CFE),
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  "1,254",
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Color(0xffE2F163),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (c, i) => SizedBox(height: 10.h),
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Show default image + forums list
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 347.h,
                          color: Color(0xffB3A0FF),
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Image.asset(
                                    "assets/comm.png",
                                    width: 323.w,
                                    height: 310.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.r),
                                        bottomRight: Radius.circular(20.r),
                                      ),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.h,
                                        horizontal: 10.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Cycling Challenge",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffE2F163),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap:
                                                    () => setState(() {
                                                      isFavorit = !isFavorit;
                                                    }),
                                                child: Icon(
                                                  Icons.star,
                                                  color:
                                                      isFavorit
                                                          ? Colors.red
                                                          : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/time.png",
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    "15 Minutes",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 20.w),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/calories.png",
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    "100 Kcal",
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
                        SizedBox(height: 10.h),
                        _buildForums(),
                      ],
                    );
                  }
                } else if (comunityController.currentCategory.value == 1) {
                  // Category "Challenges"
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Challenges and competitions",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xffE2F163),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildChallenges(),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallenges() {
    return SizedBox(
      height: 600.h,
      child: ListView.separated(
        itemCount: comunityController.challenges.length,
        separatorBuilder: (c, i) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          final item = comunityController.challenges[index];
          return Container(
            height: 110.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 15.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'] ?? " ",
                          maxLines: 2,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16.sp,
                            color: Color(0xff232323),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Flexible(
                          child: Text(
                            item['details'] ?? " ",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Color(0xff232323),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      item['image'] ?? " ",
                      width: 148.w,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildForums() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Forums",
            style: TextStyle(
              fontSize: 20.sp,
              color: Color(0xffE2F163),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color(0xff896CFE),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: SizedBox(
                height: 300.h,
                child: ListView.separated(
                  itemCount: comunityController.forums.length,
                  separatorBuilder: (c, i) => SizedBox(height: 5.h),
                  itemBuilder: (context, index) {
                    final item = comunityController.forums[index];
                    return GestureDetector(
                      onTap: () => selectedForum.value = item,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['title'] ?? "",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item['all'] ?? " ",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['subtitle'] ?? "",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                item['date'] ?? "",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Divider(color: Colors.white),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

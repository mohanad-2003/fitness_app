import 'package:fitness_app/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
// استيراد الـ SearchController

class SearchPage extends StatelessWidget {
  // استخدام Get.find للوصول إلى الـ SearchController
  final SearchController1 searchController = Get.put(SearchController1());

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_left_sharp,
                      size: 30.sp,
                      color: Color(0xffE2F163),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 20.sp, color: Color(0xff896CFE)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.to(NotificationPage()),
                    child: Icon(Icons.notifications, color: Color(0xff896CFE)),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => Get.to(ProfilePage()),
                    child: Icon(Icons.person, color: Color(0xff896CFE)),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // Search Bar
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.blueAccent,
                      backgroundColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff232323),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Filter Buttons (All, Workout, Nutrition)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFilterButton('All', 0),
                  SizedBox(width: 10),
                  _buildFilterButton('Workout', 1),
                  SizedBox(width: 10),
                  _buildFilterButton('Nutrition', 2),
                ],
              ),
              SizedBox(height: 20.h),

              Expanded(
                child: Obx(() {
                  if (searchController.currentTap.value == 0) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 180.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var items = searchController.workout[index];
                              return Container(
                                width: 198.w,
                                height: 110.h,
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
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.r),
                                            topRight: Radius.circular(20.r),
                                          ),
                                          child: Image.asset(
                                            items['image'],
                                            height: 92.h,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -15,
                                          right: 8,
                                          child: Container(
                                            width: 32.w,
                                            height: 32.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff896CFE),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 20.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: GestureDetector(
                                            onTap: () => "",
                                            child: Icon(
                                              Icons.star,
                                              color: Color(0xffE2F163),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                        horizontal: 10.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items['name'],
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Color(0xffE2F163),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/time.png",
                                                    width: 9.w,
                                                    height: 9.h,
                                                    color: Color(0xff896CFE),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    items['time'],
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 5.w),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/calories.png",
                                                      width: 9.w,
                                                      height: 9.h,
                                                      color: Color(0xff896CFE),
                                                    ),

                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      items['calory'],
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.white,
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
                            separatorBuilder:
                                (context, index) => SizedBox(width: 10.w),
                            itemCount: searchController.workout.length,
                          ),
                        ),
                        SizedBox(height: 30.h),

                        Expanded(
                          child: SizedBox(
                            height: 600.h,
                            child: ListView.separated(
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 20.h),
                              scrollDirection: Axis.vertical,
                              itemCount: searchController.allSearch.length,
                              itemBuilder: (context, index) {
                                var item = searchController.allSearch[index];
                                return Container(
                                  height: 120.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // النصوص
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.h,
                                            horizontal: 10.w,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['name'],
                                                style: TextStyle(
                                                  color: Color(0xff212020),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        "assets/time.png",
                                                        width: 9.w,
                                                        height: 9.h,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        item['time'],
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Color(
                                                            0xff212020,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          "assets/calories.png",
                                                          width: 9.w,
                                                          height: 9.h,
                                                        ),
                                                        SizedBox(width: 5.w),
                                                        Text(
                                                          item['calory'],
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Color(
                                                              0xff212020,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // ✅ عدد التمارين إن وُجد فقط
                                              if (item.containsKey(
                                                'exercises',
                                              )) ...[
                                                SizedBox(height: 5.h),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/run.png",
                                                        width: 9.w,
                                                        height: 9.h,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        item['exercises'],
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Color(
                                                            0xff212020,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),

                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                            child: Image.asset(
                                              item['image'],
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
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (searchController.currentTap.value == 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Search",
                          style: TextStyle(
                            color: Color(0xffE2F163),
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildTopSearch("Circuit"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("Split"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("Challenge"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("Legs"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("Cardio"),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Search",
                          style: TextStyle(
                            color: Color(0xffE2F163),
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildTopSearch("Breakfast"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("yogurt"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("Vegetarian"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("smoothie"),
                        SizedBox(height: 10.h),
                        _buildTopSearch("chicken"),
                      ],
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSearch(String name) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: Row(
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Color(0xffE2F163),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.search, color: Color(0xff896CFE), size: 30.h),
              ),
            ),
            SizedBox(width: 20.w),
            Text(
              name,
              style: TextStyle(
                fontSize: 13.sp,
                color: Color(0xff232323),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        searchController.SelectedTap(index); // تحديث currentTap
        searchController.fillterItem(label); // تصفية العناصر حسب الفئة المحددة
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color:
                searchController.currentTap.value == index
                    ? Color(0xffE2F163)
                    : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color:
                  searchController.currentTap.value == index
                      ? Colors.black
                      : Color(0xff896CFE),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fitness_app/controller/bottom-controller.dart';
import 'package:fitness_app/controller/favorit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  FavoritController favoritController = Get.put(FavoritController());
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BottomController bottomController = Get.put(
                          BottomController(),
                        );
                        bottomController.selectIndex(0);
                      },

                      child: const Icon(
                        Icons.arrow_left,
                        color: Color(0xffE2F163),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        "Favorites",
                        style: TextStyle(
                          color: Color(0xff896CFE),
                          fontSize: 20.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.search, color: Color(0xff896CFE), size: 25.sp),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.notifications,
                      color: Color(0xff896CFE),
                      size: 25.sp,
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.person, color: Color(0xff896CFE), size: 25.sp),
                  ],
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                          vertical: 5.h,
                        ),
                        child: Text(
                          "Sort By",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xffE2F163),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      _buildFilterButton("All", 0),
                      SizedBox(width: 10.w),
                      _buildFilterButton("Video", 1),
                      SizedBox(width: 10.w),
                      _buildFilterButton("Article", 2),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(() => _buildItem(context, favoritController.displayItems)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        favoritController.fillterItems(label);
        favoritController.selectIndex.value = index;
      },
      child: Obx(() {
        bool isSelected = favoritController.selectIndex.value == index;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: isSelected ? const Color(0xffE2F163) : Colors.white,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : const Color(0xff896CFE),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildItem(BuildContext context, RxList<Map<String, dynamic>> item) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: item.length,
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        var items = item[index];
        return items['type'] == 'Video'
            ? _buildVideoItem(context, items)
            : _buildArticleItem(context, items);
      },
    );
  }

  Widget _buildVideoItem(BuildContext context, Map<String, dynamic> items) {
    //  final screenWidth = MediaQuery.of(context).size.width;
    // final imageWidth = screenWidth * 0.38;
    // const imageHeight = 110.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items['title'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Image.asset("assets/time.png", width: 9.w, height: 9.h),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          items['duration'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        "assets/calories.png",
                        width: 9.w,
                        height: 9.h,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          items['calories'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Image.asset("assets/run.png", width: 9.w, height: 9.h),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          items['exercises'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 130.w,
              height: 100.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      items['image'],
                      fit: BoxFit.cover,
                      width: 130.w,
                      height: 92.h,
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(Icons.star, color: Color(0xffE2F163)),
                  ),
                  Container(
                    width: 18.w,
                    height: 18.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff896CFE),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Map<String, dynamic> items) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final imageWidth = screenWidth * 0.38;
    // const imageHeight = 110.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items['title'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (items.containsKey('text')) ...[
                    SizedBox(height: 5.h),
                    Text(
                      items['text'],
                      style: TextStyle(fontSize: 10.sp),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      if (items.containsKey('duration')) ...[
                        Image.asset("assets/time.png", width: 9.w, height: 9.h),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            items['duration'],
                            style: TextStyle(fontSize: 10.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                      if (items.containsKey('duration') &&
                          items.containsKey('calories'))
                        SizedBox(width: 10.w),
                      if (items.containsKey('calories')) ...[
                        Icon(Icons.local_fire_department, size: 10.sp),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            items['calories'],
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 130.w,
            height: 92.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    items['image'],
                    fit: BoxFit.cover,
                    width: 130.w,
                    height: 92.h,
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(Icons.star, color: Color(0xffE2F163)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

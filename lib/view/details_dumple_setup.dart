import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsDumpleSetup extends StatelessWidget {
  final String image;
  final String name;
  final String time;

  const DetailsDumpleSetup({
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
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                child: HeaderWorkout(name: "dumbbell step up"),
              ),
              SizedBox(height: 10.h),
              _buildContainer(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildContainerName()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      width: double.infinity,
      color: Color(0xffB3A0FF),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  "assets/dum.png",
                  width: double.infinity,
                  height: 475,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => "",
                  child: Icon(Icons.star, color: Color(0xffE2F163)),
                ),
              ),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff896CFE),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow_sharp,
                    size: 50.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContainerName() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xffE2F163),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "dumbbell step up",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Color(0xff232323),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                textAlign: TextAlign.center,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus libero eget.",
                style: TextStyle(fontSize: 12.sp, color: Color(0xff232323)),
              ),
              SizedBox(height: 5.h),
              Container(
                width: 204.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/time.png", color: Color(0xff232323)),
                      SizedBox(width: 5.w),
                      Text(
                        maxLines: 1,
                        "12 Minute",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          color: Color(0xff232323),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          "Medium",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.sp,
                            color: Color(0xff232323),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

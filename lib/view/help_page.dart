import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool isContactUsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Color(0xffE2F163),
                        size: 30.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "Help & FAQs",
                      style: TextStyle(
                        color: Color(0xff896CFE),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Text(
                    "How can we help you?",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 156.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xffE2F163),
                      ),
                      child: Center(
                        child: Text(
                          "FAQ",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContactUsExpanded =
                              !isContactUsExpanded; // Toggle the expanded state
                        });
                      },
                      child: Expanded(
                        child: Container(
                          width: 156.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Contact Us",
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: Color(0xff896CFE),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                // Contact Us Expanded section (options for Contact Us)
                if (isContactUsExpanded)
                  Column(
                    children: [
                      _buildContactOption(
                        "Customer service",
                        "assets/customer.png",
                      ),
                      _buildContactOption("Website", "assets/website.png"),
                      _buildContactOption("Whatsapp", "assets/whats.png"),
                      _buildContactOption("Facebook", "assets/face_help.png"),
                      _buildContactOption("Instagram", "assets/insta.png"),
                    ],
                  ),

                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 102.37.w,
                      height: 27.83.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xffE2F163),
                      ),
                      child: Center(
                        child: Text(
                          "General",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.91.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        width: 103.36.w,
                        height: 27.83.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Color(0xff896CFE),
                              fontSize: 14.91.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        width: 103.36.w,
                        height: 27.83.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Services",
                            style: TextStyle(
                              color: Color(0xff896CFE),
                              fontSize: 14.91.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 18.32.sp,
                      color: Color(0xff676767),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(12.r),
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10.h),
                Text(
                  "Lorem ipsum dolor sit amet?",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
                SizedBox(height: 10.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 20.h),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Praesent pellentesque congue lorem, vel tincidunt tortor\n placerat a. Proin ac diam quam. Aenean in sagittis\n magna, ut feugiat diam.",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
                SizedBox(height: 20.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 20.h),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10.h),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10.h),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10.h),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10.h),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10.h),
                _buildList("Lorem ipsum dolor sit amet?"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build contact options under "Contact Us"
  Widget _buildContactOption(String option, String image) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff896CFE),
        ),
        child: Center(
          child: Image.asset(
            image,
            width: 25.w,
            height: 25.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        option,
        style: TextStyle(fontSize: 18.sp, color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_drop_down, color: Color(0xffE2F163)),
    );
  }

  Row _buildList(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xffB3A0FF),
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),

        Expanded(
          child: GestureDetector(
            child: Icon(
              Icons.arrow_drop_down_rounded,
              color: Color(0xffE2F163),
            ),
          ),
        ),
      ],
    );
  }
}

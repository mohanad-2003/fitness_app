import 'package:fitness_app/controller/search_controller.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color(0xffE2F163),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 20, color: Color(0xff896CFE)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.to(NotificationPage()),
                    child: Icon(Icons.notifications, color: Color(0xff896CFE)),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Get.to(ProfilePage()),
                    child: Icon(Icons.person, color: Color(0xff896CFE)),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Search Bar
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff232323),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              Expanded(
                child: Obx(() {
                  if (searchController.currentTap.value == 0) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 162,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var items = searchController.workout[index];
                              return Container(
                                width: 180,
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: Image.asset(
                                            items['image'],
                                            height: 95,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -15,
                                          right: 8,
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff896CFE),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 20,
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
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items['name'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffE2F163),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/time.png",
                                                width: 9,
                                                height: 9,
                                                color: Color(0xff896CFE),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                items['time'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Spacer(),

                                              Image.asset(
                                                "assets/calories.png",
                                                width: 9,
                                                height: 9,
                                                color: Color(0xff896CFE),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                items['calory'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
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
                                (context, index) => SizedBox(width: 10),
                            itemCount: searchController.workout.length,
                          ),
                        ),
                        SizedBox(height: 30),

                        Expanded(
                          child: SizedBox(
                            height: 600,
                            child: ListView.separated(
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 20),
                              scrollDirection: Axis.vertical,
                              itemCount: searchController.allSearch.length,
                              itemBuilder: (context, index) {
                                var item = searchController.allSearch[index];
                                return Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // النصوص
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item['name'],
                                              style: TextStyle(
                                                color: Color(0xff212020),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/time.png",
                                                  width: 9,
                                                  height: 9,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  item['time'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff212020),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Image.asset(
                                                  "assets/calories.png",
                                                  width: 9,
                                                  height: 9,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  item['calory'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff212020),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // ✅ عدد التمارين إن وُجد فقط
                                            if (item.containsKey(
                                              'exercises',
                                            )) ...[
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/run.png",
                                                    width: 9,
                                                    height: 9,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    item['exercises'],
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff212020),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            child: Image.asset(
                                              item['image'],
                                              width: 150,
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
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildTopSearch("Circuit"),
                        SizedBox(height: 10),
                        _buildTopSearch("Split"),
                        SizedBox(height: 10),
                        _buildTopSearch("Challenge"),
                        SizedBox(height: 10),
                        _buildTopSearch("Legs"),
                        SizedBox(height: 10),
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
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildTopSearch("Breakfast"),
                        SizedBox(height: 10),
                        _buildTopSearch("yogurt"),
                        SizedBox(height: 10),
                        _buildTopSearch("Vegetarian"),
                        SizedBox(height: 10),
                        _buildTopSearch("smoothie"),
                        SizedBox(height: 10),
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
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffE2F163),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.search, color: Color(0xff896CFE), size: 30),
              ),
            ),
            SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(
                fontSize: 13,
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

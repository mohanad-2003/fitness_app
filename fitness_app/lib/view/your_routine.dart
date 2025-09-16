import 'package:fitness_app/controller/your_routine_controller.dart';
import 'package:fitness_app/view/details_page.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourRoutine extends StatelessWidget {
  YourRoutineController yourRoutineController = Get.put(
    YourRoutineController(),
  );
  YourRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWorkout(name: "Your Routine"),
              SizedBox(height: 20),
              Text(
                "Round 1",
                style: TextStyle(fontSize: 20, color: Color(0xffE2F163)),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () => _buildYourRoutine(yourRoutineController.yourRoutine),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYourRoutine(RxList<Map<String, dynamic>> item) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: item.length,
      itemBuilder: (context, index) {
        return _buildContainer(index);
      },
    );
  }

  Widget _buildContainer(int index) {
    final item = yourRoutineController.yourRoutine[index];
    return 
    GestureDetector(
onTap: () => Get.to(
DetailsPage(
  image:item['image'],
  title:item['title'],
),


),

      child: 
    Container(
      width: 157,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  item['image'],
                  width: double.infinity,
                  height: 92,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => yourRoutineController.toggleFavorit(index),

                  child: Obx(() {
                    final isFav =
                        yourRoutineController.yourRoutine[index]['isFavorit'];
                    return Icon(
                      Icons.star_outlined,
                      color: isFav ? Color(0xffE2F163) : Colors.white,
                    );
                  }),
                ),
              ),
              Positioned(
                bottom: -10,
                right: 5,
                child: Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff896CFE),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => "",
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                    color: Color(0xffE2F163),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/time.png",
                          color: Color(0xff896CFE),
                        ),
                        SizedBox(width: 5),
                        Text(
                          item['time'],
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/calories.png",
                          color: Color(0xff896CFE),
                        ),
                        SizedBox(width: 5),
                        Text(
                          item['rep'],
                          style: TextStyle(fontSize: 12, color: Colors.white),
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
    ),
    );
  }
}

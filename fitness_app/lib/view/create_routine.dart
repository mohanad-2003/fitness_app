import 'package:fitness_app/controller/create_routine_controller.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRoutine extends StatelessWidget {
  final CreateRoutineController createRoutineController = Get.put(
    CreateRoutineController(),
  );

  CreateRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWorkout(name: "Create your routine"),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => _buildGridview(createRoutineController.createRoutine),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridview(RxList<Map<String, dynamic>> createRoutine) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      itemCount: createRoutine.length,
      itemBuilder: (context, index) {
        return _buildItem(index);
      },
    );
  }

  Widget _buildItem(int index) {
    final item = createRoutineController.createRoutine[index];

    return Container(
      width: 157,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  item['image'],
                  width: double.infinity,
                  height: 92,
                  fit: BoxFit.cover,
                ),
              ),
              // أيقونة المفضلة
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => createRoutineController.toggleFavorit(index),
                  child: Obx(() {
                    final isFav =
                        createRoutineController
                            .createRoutine[index]['isFavorit'];
                    return Icon(
                      Icons.star_rate_rounded,
                      color: isFav ? const Color(0xffE2F163) : Colors.white,
                    );
                  }),
                ),
              ),
              // ✅ فقط عندما يكون مضاف يظهر Check
              Obx(() {
                final isAdded =
                    createRoutineController.createRoutine[index]['isAdded'];
                return isAdded
                    ? Positioned(
                      bottom: -15,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => createRoutineController.toggleAdded(index),
                        child: Container(
                          width: 23,
                          height: 23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE2F163),
                          ),
                          child: Center(child: Image.asset("assets/check.png")),
                        ),
                      ),
                    )
                    : Positioned(
                      bottom: -15,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => createRoutineController.toggleAdded(index),
                        child: Container(
                          width: 23,
                          height: 23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff896CFE),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ); // لا شيء إذا مش مضاف
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(
                    color: Color(0xffE2F163),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/time.png",
                          color: const Color(0xff896CFE),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          item['time'],
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/calories.png",
                          color: const Color(0xff896CFE),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          item['rep'],
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
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
  }
}

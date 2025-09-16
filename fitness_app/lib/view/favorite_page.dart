import 'package:fitness_app/controller/bottom-controller.dart';
import 'package:fitness_app/controller/favorit_controller.dart';
import 'package:flutter/material.dart';
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
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03,
              horizontal: screenWidth * 0.07,
            ),
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
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xffE2F163),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Text(
                        "Favorites",
                        style: TextStyle(
                          color: Color(0xff896CFE),
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Color(0xff896CFE),
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.notifications,
                      color: Color(0xff896CFE),
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.person,
                      color: Color(0xff896CFE),
                      size: 25,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                        child: Text(
                          "Sort By",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffE2F163),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      _buildFilterButton("All", 0),
                      const SizedBox(width: 10),
                      _buildFilterButton("Video", 1),
                      const SizedBox(width: 10),
                      _buildFilterButton("Article", 2),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        var items = item[index];
        return items['type'] == 'Video'
            ? _buildVideoItem(context, items)
            : _buildArticleItem(context, items);
      },
    );
  }

  Widget _buildVideoItem(BuildContext context, Map<String, dynamic> items) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.38;
    const imageHeight = 110.0;

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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset("assets/time.png", width: 9, height: 9),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          items['duration'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset("assets/calories.png", width: 9, height: 9),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          items['calories'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset("assets/run.png", width: 9, height: 9),
                      const SizedBox(width: 5),
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
          SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    items['image'],
                    fit: BoxFit.cover,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(Icons.star, color: Color(0xffE2F163)),
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff896CFE),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Map<String, dynamic> items) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.38;
    const imageHeight = 110.0;

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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (items.containsKey('text')) ...[
                    const SizedBox(height: 5),
                    Text(
                      items['text'],
                      style: const TextStyle(fontSize: 10),
                      maxLines: 3,
                      //  overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      if (items.containsKey('duration')) ...[
                        Image.asset("assets/time.png", width: 9, height: 9),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            items['duration'],
                            style: TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                      if (items.containsKey('duration') &&
                          items.containsKey('calories'))
                        const SizedBox(width: 10),
                      if (items.containsKey('calories')) ...[
                        const Icon(Icons.local_fire_department, size: 10),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            items['calories'],
                            style: TextStyle(fontSize: 12),
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
            width: imageWidth,
            height: imageHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    items['image'],
                    fit: BoxFit.cover,
                    width: imageWidth,
                    height: imageHeight,
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

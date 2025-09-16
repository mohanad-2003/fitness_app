import 'package:fitness_app/controller/homecontroller.dart';
import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
import 'package:fitness_app/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primaryColor = Color(0xff896CFE);
const accentColor = Color(0xffE2F163);
const backgroundColor = Color(0xff232323);
const textStyle = TextStyle(fontSize: 10, color: Colors.white);

class HomePage extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 5),
                    _buildSubheader(),
                    SizedBox(height: 20),
                    _buildCategory(
                      homecontroller.categories,
                      homecontroller.scrollController,
                    ),
                    SizedBox(height: 20),
                    _buildRecommendationsSection(),
                    SizedBox(height: 20),
                    _buildRecommendations(
                      context,
                      homecontroller.recommendations,
                      homecontroller.scrollController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildWeeklyCallenge(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: _buildArticlesTips(
                  context,
                  homecontroller.articlesAndTips,
                  homecontroller.scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticlesTips(
    BuildContext context,
    List<Map<String, String>> articles,
    ScrollController scroll,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Articles & Tips",
          style: TextStyle(color: accentColor, fontSize: 14),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            controller: scroll,
            itemBuilder: (context, index) {
              var article = articles[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          article['image'] ?? "",
                          width: imageWidth,
                          height: 134,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => "",
                          child: Icon(Icons.star, color: accentColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: imageWidth,
                    child: Text(
                      article['description'] ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: articles.length,
          ),
        ),
      ],
    );
  }

  Container _buildWeeklyCallenge() {
    return Container(
      width: double.infinity,
      color: Color(0xffB3A0FF),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Container(
          height: 165,
          decoration: BoxDecoration(
            color: Color(0xff212020),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      "Weekly\nChallenge",
                      style: TextStyle(fontSize: 24, color: accentColor),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Plank With Hip Twist",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/weekly.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "Hi, Madison",
          style: TextStyle(fontSize: 20, color: primaryColor),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Get.to(SearchPage()),
          child: _buildIcon(Icons.search),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => Get.to(NotificationPage()),
          child: _buildIcon(Icons.notifications),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => Get.to(ProfilePage()),
          child: _buildIcon(Icons.person),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Icon(icon, color: primaryColor);
  }

  Widget _buildSubheader() {
    return Text(
      "It's time to challenge your limits.",
      style: TextStyle(
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRecommendationsSection() {
    return Row(
      children: [
        Text(
          "Recommendations",
          style: TextStyle(
            fontSize: 15,
            color: accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text("See All", style: TextStyle(color: Colors.white)),
        SizedBox(width: 5),
        Icon(Icons.arrow_right, color: accentColor),
      ],
    );
  }

  Widget _buildRecommendations(
    BuildContext context,
    List<Map<String, String>> recommendations,
    ScrollController scroll,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.62;

    return SizedBox(
      height: 190,
      child: ListView.separated(
        controller: scroll,
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          var rec = recommendations[index];
          return _buildRecommendationCard(rec, cardWidth);
        },
      ),
    );
  }

  Widget _buildRecommendationCard(
    Map<String, String> recommendation,
    double width,
  ) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
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
                  recommendation['image'] ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.star_purple500_outlined, color: accentColor),
              ),
              Positioned(
                bottom: -15,
                right: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  recommendation['nameVideo'] ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.access_time_filled_rounded, color: primaryColor),
                    SizedBox(width: 5),
                    Text(recommendation['time_train'] ?? "", style: textStyle),
                    Spacer(),
                    Icon(Icons.fireplace_sharp, color: primaryColor),
                    SizedBox(width: 5),
                    Text(recommendation['Kcal'] ?? "", style: textStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
    List<Map<String, String>> categories,
    ScrollController scroll,
  ) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        controller: scroll,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder:
            (context, index) => Container(width: 0.7, color: Color(0xffB3A0FF)),
        itemBuilder:
            (context, index) => _buildCategoryCard(categories[index], index),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, String> category, int index) {
    bool isSelected = index == 0;

    return IntrinsicHeight(
      // يجعل ارتفاع البطاقة يعتمد على محتواها
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ارتفاع العمود يعتمد على محتواه
          children: [
            if ((category['image'] ?? "").isNotEmpty)
              Image.asset(category['image']!, width: 40, height: 20),
            SizedBox(height: 5),
            Text(
              category['name'] ?? "",
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Color(0xffE2F163) : Color(0xff896CFE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

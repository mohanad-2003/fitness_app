import 'package:flutter/material.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Help & FAQs",
                      style: TextStyle(
                        color: Color(0xff896CFE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "How can we help you?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 156,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffE2F163),
                      ),
                      child: Center(
                        child: Text(
                          "FAQ",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContactUsExpanded =
                              !isContactUsExpanded; // Toggle the expanded state
                        });
                      },
                      child: Expanded(
                        child: Container(
                          width: 156,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Contact Us",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff896CFE),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

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

                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 102.37,
                      height: 27.83,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffE2F163),
                      ),
                      child: Center(
                        child: Text(
                          "General",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.91,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: 103.36,
                        height: 27.83,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Color(0xff896CFE),
                              fontSize: 14.91,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: 103.36,
                        height: 27.83,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Services",
                            style: TextStyle(
                              color: Color(0xff896CFE),
                              fontSize: 14.91,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 18.32,
                      color: Color(0xff676767),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 20),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Praesent pellentesque congue lorem, vel tincidunt tortor\n placerat a. Proin ac diam quam. Aenean in sagittis\n magna, ut feugiat diam.",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 20),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 20),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10),
                _buildList("Lorem ipsum dolor sit amet?"),
                SizedBox(height: 10),
                Divider(color: Color(0xffE2F163)),
                SizedBox(height: 10),
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
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff896CFE),
        ),
        child: Center(
          child: Image.asset(image, width: 25, height: 25, fit: BoxFit.cover),
        ),
      ),
      title: Text(option, style: TextStyle(fontSize: 18, color: Colors.white)),
      trailing: Icon(Icons.arrow_drop_down, color: Color(0xffE2F163)),
    );
  }

  Row _buildList(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xffB3A0FF),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Spacer(),
        GestureDetector(
          child: Icon(Icons.arrow_drop_down_rounded, color: Color(0xffE2F163)),
        ),
      ],
    );
  }
}

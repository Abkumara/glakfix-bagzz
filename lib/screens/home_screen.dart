import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glak_fashion/app/controller/navigation_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());
    final List<Widget> _pages = [
      Center(child: Text("Home")),
      Center(child: Text("Search")),
      Center(child: Text("Profile")),
      Center(child: Text("Profile")),
    ];
    final List<String> images = [
      'https://via.placeholder.com/600x300/FF0000/FFFFFF?text=Slide+1',
      'https://via.placeholder.com/600x300/00FF00/FFFFFF?text=Slide+2',
      'https://via.placeholder.com/600x300/0000FF/FFFFFF?text=Slide+3',
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Text(
            'bagzz',
            style: GoogleFonts.playfairDisplay(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  size: 32,
                ))
          ],
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: images.map((imgUrl) {
                return Builder(
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      //decoration: BoxDecoration(bor),
                      child: Image.network(imgUrl),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                  height: 205,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1),
            )
          ],
        ),
        bottomNavigationBar: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Material(
              elevation: 8,
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.black,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                        ),
                        label: ''),
                  ],
                  currentIndex: navigationController.selectedIndex.value,
                  selectedItemColor: Colors.amber,
                  onTap: navigationController.changedIndex,
                  backgroundColor: Colors.white,
                  elevation: 20,
                ),
              ),
            ),
          );
        }));
  }
}

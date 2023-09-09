import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imagepath = [
    'images/slide1.png',
    'images/slide2.png',
    // Replace with your image URLs
    // Replace with your image URLs
    // Add more image URLs here if needed
  ];

  ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        // clipBehavior: Clip.none,
        // padEnds: true,

        viewportFraction: 0.98,
        height: 150,

        // viewportFraction: 0.95,
        // Adjust the height as needed
        // autoPlay: true, // Enable auto-play
        // enlargeCenterPage: true,
        aspectRatio: 16/9,
        // autoPlayCurve: Curves.fastOutSlowIn,
        // enableInfiniteScroll: true,
        // pauseAutoPlayOnTouch: true,
      ),
      items: imagepath.map((imagepath) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 150,
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagepath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
    // return SizedBox(
    //   height: 200,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: imagepath.length,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.only(left: 8.0),
    //         child: Image.asset(
    //           imagepath[index],
    //           width: 350,
    //           fit: BoxFit.contain,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

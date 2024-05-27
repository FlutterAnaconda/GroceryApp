// Import the necessary packages at the beginning of your Dart file
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';


class AllCategory extends StatelessWidget {
  static const String routename = '/AllCategory';
  final List<ProductModel> imagepath = [
    ProductModel(image: 'images/catergoryimages/g1.png', title: 'Meat'),
    ProductModel(image: 'images/catergoryimages/g2.png', title: 'Fruit'),
    ProductModel(image: 'images/catergoryimages/g3.png', title: 'Cold'),
    ProductModel(image: 'images/catergoryimages/g4.png', title: 'Vegetables'),
    ProductModel(image: 'images/catergoryimages/g5.png', title: 'Dairy'),
    ProductModel(image: 'images/catergoryimages/g6.png', title: 'Bakery'),
    ProductModel(image: 'images/catergoryimages/g7.png', title: 'Meals'),
    ProductModel(image: 'images/catergoryimages/g8.png', title: 'Fishes'),
    ProductModel(image: 'images/catergoryimages/g9.png', title: 'Eggs'),
    ProductModel(image: 'images/catergoryimages/g10.png', title: 'juices'),
    ProductModel(image: 'images/catergoryimages/g11.png', title: 'Ice Cream'),
    ProductModel(image: 'images/catergoryimages/g12.png', title: 'Fresh'),
  ];

  AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MYDetailsappbar(
        text: 'All Categories',
        onpressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3/3.4,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: imagepath.length,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: const Color(0xff51BC7D).withOpacity(0.20),
                    ),
                    height: 70,
                    width: 70,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(imagepath[index].image!),
                          // Adjust the height of the images as needed
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                   const SizedBox(height: 8,),
                   Text(imagepath[index].title!, style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: const Color(0xff636464),
            ),),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

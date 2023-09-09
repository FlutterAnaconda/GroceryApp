import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/productmodel.dart';

class CatergoryBuilder extends StatelessWidget {
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

  CatergoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return SizedBox(
      height: 72,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: imagepath.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(

                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: const Color(0xff51BC7D).withOpacity(0.20),
                ),
                height: 49,
                width: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(imagepath[index].image!),
                    // Adjust the height of the images as needed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6.0, top: 5.0),
                child: Text(
                  imagepath[index].title!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff636464),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

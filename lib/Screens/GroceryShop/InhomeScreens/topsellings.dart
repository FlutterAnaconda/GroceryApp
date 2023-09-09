import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/productmodel.dart';

class TopsellingListScreen extends StatefulWidget {
  static const String routename = '/TopsellingListScreen';
  const TopsellingListScreen({super.key});

  @override
  State<TopsellingListScreen> createState() => _TopsellingListScreenState();
}

class _TopsellingListScreenState extends State<TopsellingListScreen> {
  List<ProductModel> list = [
    ProductModel(
      title: "Orgnaic",
      image: "images/mango.png",
      price: 23,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "Orange",
      image: "images/mango.png",
      price: 64,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "Gun",
      image: "images/mango.png",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "shorma",
      image: "images/mango.png",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "alo",
      image: "images/mango.png",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "pizza",
      image: "images/mango.png",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "burger",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "boring",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "nightmare",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "chines bili",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      subtitle: '91 park st,12',
    ),
    ProductModel(
      title: "bullet",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      subtitle: '91 park st,12',
    ),
  ];

  bool isloaded = false;
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    // final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MYDetailsappbar(
        text: 'Top sellings',
        onpressed: () => Navigator.pop(context),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        clipBehavior: Clip.none,
        itemBuilder: (BuildContext context, int index) {
          if (list.isEmpty) {
            return const CircularProgressIndicator();
          }
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the container background color
                    borderRadius:
                        BorderRadius.circular(9), // Optional: Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 0, // Spread radius (controls the blur)
                        blurRadius: 3.5630252361297607, // Blur radius
                        offset: const Offset(0,
                            1.7815126180648804), // Offset in the x and y axes
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: SizedBox(
                    width: 260,


                    // Replace with your desired fixed width
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0,top: 6),
                              child: Text(
                                list[index].title!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                list[index].subtitle!,
                                style: GoogleFonts.poppins(
                                  fontSize: 11.38,
                                  color: const Color(0xff9C9898),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0,top: 10),
                              child: Text(
                                '\$${list[index].price!.toStringAsFixed(1)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff34A853),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // top: 0,
                bottom: 43,
                right: 70,
                // right: 0,
                child: list[index].image!.contains('http')
                    ? Image.network(
                        list[index].image!,
                        height: 80,
                        width: 130,
                        // fit: BoxFit.fill,
                      )
                    : Image.asset(
                        list[index].image!,
                        height: 80,
                        width: 150,
                        // fit: BoxFit.fill,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

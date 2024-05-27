import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import '../../models/productmodel.dart';

class TopsellingListview extends StatefulWidget {
  const TopsellingListview({super.key});

  @override
  State<TopsellingListview> createState() => _TopsellingListviewState();
}

class _TopsellingListviewState extends State<TopsellingListview> {
  List<ProductModel> list = [
    ProductModel(
      title: "Orgnaic Mango",
      image: "images/mango.png",
      price: 23,
      subtitle: 'alabama',
    ),
    ProductModel(
      title: "Fresh Orange",
      image: "images/mango.png",
      price: 64,
      subtitle: 'alabama',
    ),
    ProductModel(
      title: "Gun",
      image: "images/mango.png",
      price: 45,
      subtitle: 'alabama',
    ),
    ProductModel(
      title: "shorma",
      image: "images/mango.png",
      price: 45,
      subtitle: 'alabama',
    ),
    ProductModel(
      title: "alo",
      image: "images/mango.png",
      price: 45,
      subtitle: 'alabama',
    ),
    ProductModel(
      title: "pizza",
      image: "images/mango.png",
      price: 45,
      subtitle: 'alabama',
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

    return SizedBox(
      height: 82,
      //own height was 77
      child: ListView.builder(
        padding:  const EdgeInsets.only(left: 12),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        clipBehavior: Clip.none,
        itemBuilder: (BuildContext context, int index) {
          if (list.isEmpty) {
            return const CircularProgressIndicator();
          }
          return Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(
                          subtitle: list[index].subtitle!,
                              image: list[index].image!,
                              location: list[index].subtitle!,
                              price: list[index].price!,
                              title: list[index].title!,
                            ))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the container background color
                      borderRadius:
                          BorderRadius.circular(5), // Optional: Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.10), // Shadow color
                          spreadRadius: 0, // Spread radius (controls the blur)
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0,
                              2), // Offset in the x and y axes
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    child: SizedBox(
                      width: 222,

                      // Replace with your desired fixed width
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0,top:8),
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
                                padding: const EdgeInsets.only(left: 6.0,top: 6,bottom: 5),
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
              ),
              Positioned(
                // top: 0,
                bottom: 28,
                right: 0,
                // right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            subtitle: list[index].subtitle!,
                                image: list[index].image!,
                                location: list[index].subtitle!,
                                price: list[index].price!,
                                title: list[index].title!,
                              ))),
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
              ),
            ],
          );
        },
      ),
    );
  }
}

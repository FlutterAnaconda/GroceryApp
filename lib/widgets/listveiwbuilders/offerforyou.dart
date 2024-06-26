import 'package:dotcoder1/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';

// ignore: must_be_immutable
class OfferListveiw extends StatelessWidget {
  List<ProductModel> list = [
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 7066.png',
      rating: 3,
      subtitle: 'Dollar pantry',
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'Gromit\'s Offer',
      subtitle: 'Dollar pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'carbs',
      subtitle: 'Dollar pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'tamatar',
      subtitle: 'Dollar pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    )
  ];

  OfferListveiw({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return SizedBox(
      height: 258,
      child: ListView.builder(
        padding:  const EdgeInsets.only(left: 8),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      subtitle: list[index].subtitle!,
                          image: list[index].image!,
                          location: list[index].location!,
                          price: list[index].price!,
                          title: list[index].title!,
                        ))),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the container background color
                borderRadius:
                    BorderRadius.circular(14), // Optional: Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 0, // Spread radius (controls the blur)
                    blurRadius: 3.5630252361297607, // Blur radius
                    offset: const Offset(
                        0, 1.7815126180648804), // Offset in the x and y axes
                  ),
                ],
              ),
              margin: const EdgeInsets.all(8),
              child: SizedBox(
                width: 212, // Replace with your desired fixed width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius:  const BorderRadius.all(Radius.circular(10)),
                  //         topLeft: Radius.circular(10),
                  //         topRight: Radius.circular(10),
                  // bottomLeft: Radius.circular(10),
                  // bottomRight: Radius.circular(10)),

                      child: Image.asset(
                        list[index].image!,
                        height: 180,
                        width: 212,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            list[index].title!,
                            style: GoogleFonts.poppins(
                              fontSize: 16.03,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff34A853),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0,),
                          child: Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            list[index].rating!.toStringAsFixed(1),
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w400
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Icon(Icons.location_on,
                              color: Colors.black45, size: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Text(
                            list[index].location!,
                            style: GoogleFonts.poppins(
                                fontSize: 12.47,
                                color: Colors.black45,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/tabbar_tab/itemtab.dart';
import '../../../widgets/text/constants.dart';

class TabbarContent extends StatelessWidget {
  const TabbarContent({super.key});

  @override
  Widget build(BuildContext context) {
     return ListView.builder(
       padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the container background color
              borderRadius:
              BorderRadius.circular(9), // Optional: Rounded corners
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
            child: Stack(
              children: [
                list[index].discount!
                    ? Positioned(
                    right: 20,
                    child: Container(
                      width: 25.34,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            list[index].price! <= 25
                                ? 'images/yellow.png'
                                : 'images/green.png',
                          ),
                          fit: BoxFit.cover, // Adjust the fit to your needs
                        ),
                      ),
                    ))
                    : Container(),
                SizedBox(
                  height: 100, // Replace with your desired fixed width
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9)),
                        child: Image.asset(
                          list[index].image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].title!,
                            style: GoogleFonts.poppins(
                              fontSize: 16.03,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff34A853),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/star1.png',
                                width: 14.25,
                                height: 14.25,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 2.0, left: 6),
                                child: Text(
                                  list[index].rating!.toStringAsFixed(1),
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, fontWeight: FontWeight.w400
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                '(24)',
                                style: k12lightgrey400,
                              )
                            ],
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 18.0, top: 15),
                            child: Text(
                              '\$${list[index].price!.toStringAsFixed(1)}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

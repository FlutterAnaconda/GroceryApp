import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Providers/storeprovider.dart';
import '../../Screens/GroceryShop/Bottomtab/Storetab.dart';

import '../../models/productmodel.dart';

class AllStores extends StatefulWidget {
  const AllStores({super.key});

  @override
  State<AllStores> createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {
  List<ProductModel> list = [
    ProductModel(
      title: 'Blazzing Store',
      image: 'images/Group 7066.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    )
  ];
  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return SizedBox(
      height: 162,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              Provider.of<StoreProvider>(context, listen: false)
                  .selectStore(list[index]),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StoreTab(),
                ),
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the container background color
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 0.5,
                    color: Colors.black
                        .withOpacity(0.05)), // Optional: Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 0, // Spread radius (controls the blur)
                    blurRadius: 2.54415602684021, // Blur radius
                    offset: const Offset(0, 2), // Offset in the x and y axes
                  ),
                ],
              ),
              margin: const EdgeInsets.all(8),
              child: SizedBox(
                width: 252, // Replace with your desired fixed width
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 0),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                              list[index].image!,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 10,),
                              child: Text(
                                list[index].title!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:6,top:3.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xff737373),
                                    size: 15,
                                  ),
                                  Text(
                                    list[index].location!,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black45, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6,top:6.0),
                              child: Row(
                                children: [
                                  Image.asset('images/liststar.png',width: 14.25,height:  14.25,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 3),
                                    child: Text(
                                      list[index].rating!.toStringAsFixed(1),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Text('(19)',style: k12lightgrey400,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0,bottom: 30),
                          child: IconButton(
                               onPressed: () {
                                 setState(() {
                                   list[index].isfav = !list[index].isfav;
                                   // Toggle favorite state
                                 });
                               },
                              icon: Image.asset(
                                list[index].isfav
                                    ? 'images/fillheart.png'
                                    : 'images/heart.png',
                               width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                            )
                          ),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      'Lorem ipsum dolor sit amet, Lorem \nipsum dolor sit amet, consectetur ',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff9C9898)),
                    )
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

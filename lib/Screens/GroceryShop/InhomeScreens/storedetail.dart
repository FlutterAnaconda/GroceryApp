
import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/Tab_bar_content_of%20vendor.dart';

import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/outofstock.dart';

import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/usertype.dart';
import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';


import '../Vendormodule/tab_bar_content.dart';
class Storesdetailscreen extends StatefulWidget {
  static const String routename = '/AllStoresscreen';
  final String imagepath;
  final String title;
  final String location;
  final int rating;
  final bool isfav;

  const Storesdetailscreen(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.location,
      required this.rating,
      required this.isfav});

  @override
  State<Storesdetailscreen> createState() => _StoresdetailscreenState();
}

class _StoresdetailscreenState extends State<Storesdetailscreen> {
  final List<Widget> tabs = [
    const Tab(text: 'All'),
    const Tab(text: 'Meat'),
    const Tab(text: 'Cooking'),
    const Tab(text: 'Fruits'),
    const Tab(text: 'Vegetables'),
    const Tab(text: 'Dairy'),
  ];


  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    final whichuser = Provider.of<Usertype>(context).isuser!;
    print(whichuser);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MYDetailsappbar(
          text: 'Store Details',
          onpressed: () => whichuser?(Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>const HomeScreen()))):Navigator.pop(context)),
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                expandedHeight: 440.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Image.asset('images/store.png', fit: BoxFit.cover),
                      buildsinglestore(
                        widget.imagepath,
                        widget.title,
                        widget.location,
                        widget.rating,
                        widget.isfav,
                        whichuser,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                labelPadding: const EdgeInsets.symmetric(horizontal: 11),
                unselectedLabelColor: const Color(0xff868889),
                labelStyle: k12Grey400style,
                tabs: tabs,
                dividerColor: Colors.white,
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: tabs.map((tab) {
                    // You can return different content for each tab
                    return whichuser
                        ? const TabbarContent()
                        :const VendorTabbarconent();
                    // buildContentForvendor(); // Implement your content widgets
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ProductModel> list = [
    ProductModel(
      title: 'Rediscover food',
      image: 'images/Group 7066.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      discount: true,
    ),
    ProductModel(
      title: 'Rediscover food',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 20,
      discount: true,
    ),
    ProductModel(
      title: 'norm',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'pharse',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'glue',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      discount: true,
    ),
    ProductModel(
      title: 'master',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'shifoo',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      discount: true,
    ),
    ProductModel(
      title: 'doremon',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'pizzahot',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'speicy pizza',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'cucumber juice',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
  ];




  


  Widget buildsinglestore(String imagepath, String title, String location,
      int rating, bool isfav, bool isuser) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the container background color
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            width: 0.5,
            color: Colors.black.withOpacity(0.05)), // Optional: Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Shadow color
            spreadRadius: 0, // Spread radius (controls the blur)
            blurRadius: 1.5, // Blur radius
            offset: const Offset(0, 2), // Offset in the x and y axes
          ),
        ],
      ),
      // margin: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        height: 192, // Replace with your desired fixed width
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      imagepath,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, left: 10),
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 12.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xff737373),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            location,
                            style: GoogleFonts.poppins(
                                color: Colors.black45, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                          height: 18,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  'images/star1.png',
                                  height: 16,
                                  width: 16,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Image.asset(
                    isfav ? 'images/fillheart.png' : 'images/heart.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 8),
              child: Text(
                'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit\namet,consectetur adipiscing elit.consectetur\nadipiscing. ',
                style: k12Grey400style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/delivery.png',
                    scale: 3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Delivery time',
                    style: k12B600style,
                  ),
                  Text(
                    ': 2-3 hours.',
                    style: k12Grey400style,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  isuser
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const OutofStockScreen(

                                        )));
                          },
                          child: Text(
                            'view Out of Stock',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: const Color(0xff059F55),
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                            ),
                          ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

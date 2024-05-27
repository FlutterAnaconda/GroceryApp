import 'package:dotcoder1/Screens/GroceryShop/Bottomtab/Storetab.dart';
import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/Notification.dart';
import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/VendorhomeScreen.dart';
import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/vendorbottomtab/saletab.dart';
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/widgets/cards/salescard.dart';
import 'package:dotcoder1/widgets/text/homerowtext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/cards/orderstatus.dart';
import '../../../../widgets/cards/vendorstorecard.dart';
import 'customchart.dart';

class VHometab extends StatefulWidget {
  const VHometab({super.key});

  @override
  State<VHometab> createState() => _VHometabState();
}

class _VHometabState extends State<VHometab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Add your logic here for the first icon onTap event.
                      },
                      child: const Image(
                        image: AssetImage(
                          'images/menu-bar 1.png',
                        ),
                        width: 25,
                        height: 24,
                      ),
                    ),
                  ),
                  Text(
                    'Store App',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Image(
                          image: AssetImage('images/bell.png'),
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 215,
                  width: MediaQuery.of(context).size.width,
                  child: Vendorchart()),
              Vendorhomerowtext(
                  righttext: 'Sales',
                  lefttext: 'Show more',
                  ontap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (c) => const Saletab(

                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SalesCard(
                      centertext: 'Today\'s',
                      amount: '\$35',
                      image: 'images/sale1.png'),
                  SalesCard(
                      centertext: 'Al Sales',
                      amount: '\$350',
                      image: 'images/sale2.png')
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               const Vendorhomerowtext(
                  righttext: 'Orders', lefttext: 'View Details',),
              OrderStatus(),
              const SizedBox(
                height: 10,
              ),
               Vendorhomerowtext(
                  righttext: 'Stores', lefttext: 'View Details',ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>const StoreTab()));
              },),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: VendorStore(
                        text: 'Categories',
                        amount: '14',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: VendorStore(
                        text: 'Products',
                        amount: '56',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

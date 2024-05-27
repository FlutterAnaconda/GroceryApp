
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/constants.dart';

class OrderScuccessfull extends StatelessWidget {
  const OrderScuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const SizedBox(height: 115,),
                  Image.asset('images/orderdone.png',height: 199,width:223 ,fit: BoxFit.contain,),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'You place the Order\n      Successfully',
                      style: k22B500style,
                    ),
                  ),
                  const SizedBox(height:35),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Your order is placed nicely. We start\n   our delivery process and you will\n           receive your item soon',
                      style: k14Grey7C300style,
                    ),
                  ),
                  const SizedBox(height: 80,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: GradientElevatedButton(
                      text: 'Back To Home',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (c) => const HomeScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
               Positioned(
                top: 0,
                right: 0,

                child: Image(
                  image: const AssetImage('images/bgcolor.png',),
                  width: MediaQuery.of(context).size.width,
                  height: 380,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ));
  }
}

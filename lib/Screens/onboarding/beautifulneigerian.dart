import 'package:dotcoder1/Screens/onboarding/Smoothpageindiactor.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';

class Beautifulneigerion extends StatelessWidget {
  const Beautifulneigerion({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
            backgroundColor:Colors.white,
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

               const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        // child: Container(
                        //   height: 100,
                        //   width: 100,
                        //   color: Colors.red,
                        // ),

                        child: Image(
                          image: AssetImage('images/bgcolor.png',),
                          width: 400,
                          height: 380,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 80.0),
                        child: Image(
                          image: AssetImage('images/handsomafarican.png'),
                          height: 350,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              const BoldText(text: 'Get your Groceries\n      easily with us'),
              const SizedBox(height: 15),
               Text(

                      "You can access all verity of groceries\nhere and fast delivery service system",style: k14Grey700style,),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GradientElevatedButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyPageView.routename);
                    }),
              )
            ],
          ),
        )),
      );

  }
}

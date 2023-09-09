import 'dart:ui';

import 'package:dotcoder1/Screens/onboarding/beautifulneigerian.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/usertype.dart';
import '../../widgets/text/BoldText.dart';

import '../../widgets/textfields/butons/Myfilledbutton.dart';

import '../../widgets/textfields/butons/outlinebutton.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final whichuser = Provider.of<Usertype>(context);
    bool isbuyer = false;

    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child:  Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: mediaquery.height,
            width: mediaquery.width,
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [




    // Container(
    // width: 200,
    // height: 200,
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(10),
    // image: DecorationImage(
    // image: AssetImage('images/Welcome Screen.png'),
    // fit: BoxFit.cover,
    // ),
    // ),
    // child: ClipRRect(
    // borderRadius: BorderRadius.circular(10),
    // child: BackdropFilter(
    // filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    // child: Container(
    // color: Colors.black.withOpacity(0), // Adjust the opacity as needed
    // ),
    // ),
    // ),
    // ),

                   const Stack(
                     clipBehavior: Clip.none,
                    children: [
                      // bgcolor.png
                      Positioned(
                        top: 0,
                        left: 0,

                        child: Image(
                          image: AssetImage('images/bgcolor.png',),
                          width: 550,
                          height: 380,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:60,left:14.0,right:14.0),
                        child: Image(
                          image: AssetImage('images/Welcome Screen.png'),
                          height: 400
                        ),
                      ),

                    ],
                  ),
                  const BoldText(
                      text: "Let’s sell & buy grocery\n        with easy way"),
                  const SizedBox(height:20),
                  Text(
                    'You can access all verity of groceries\nhere and fast delivery service system',
                    style: k14Grey500style,
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 275,
                    child: GradientElevatedButton(
                      text: 'Login as a user',
                      onPressed: () {
                        // Add your button's onPressed logic here
                        setState(() {
                          isbuyer = true;
                          whichuser.isUser(isbuyer);
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Beautifulneigerion())
                            // MyPageView.routename
                            );
                      },
                    ),
                  ),
                  SizedBox(height: mediaquery.height * 0.01),
                  SizedBox(
                    width: 275,
                    child: Myoutlinebutton(
                        onTap: () {
                          setState(() {
                            isbuyer = false;
                            whichuser.isUser(isbuyer);
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Beautifulneigerion(),
                              ));
                        },
                        text: 'Login as a vendor'),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),

    );
  }
}


import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/text/constants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/text/BoldText.dart';

import '../../widgets/textfields/butons/Myfilledbutton.dart';

class MyPageView extends StatefulWidget {
  static const String routename = '/Smoothpageindicaation';

  const MyPageView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController(initialPage: 0);
  final int pageCount = 3; // Number of pages
  int currentPage = 0;
  @override
  void initState() {
    super.initState();

    // Add a listener to the PageController to track page changes
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt();

      });
    });
  }

  int activeDotIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child:
         Scaffold(
          backgroundColor:Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: mediaquery.height * 0.02),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   const SignInScreen())
                          // RegistrationScreen.routename
                          );
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 545,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      // _buildmypage("images/handsomafarican.png",
                      //     "Get your Groceries\n     easily with us", 15.0),
                      _buildmypage("images/image 3.png",
                          "Place your order\nget fast delivery", 15.0),
                      _buildmypage("images/image 6.png",
                          "Buy Fresh Fruit\nand Vegetables", 0.0),
                      _buildmypage("images/image 3.png",
                          "Place your order\nget fast delivery", 15.0),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: pageCount,
                  effect: const CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                        height: 8.16,
                        color: Color(0xff34A853),
                        width: 26.35,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    dotDecoration: DotDecoration(
                      height: 9.41,
                      width: 9.41,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      dotBorder: DotBorder(
                        color: Color(0xff34A853),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 150,
                //   height: 30,
                //   child: ListView.builder(
                //     itemCount: 3,
                //     physics: const NeverScrollableScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //           padding: const EdgeInsets.only(left: 8.0),
                //           child: currentPage == index
                //               ? SmoothPageIndicator(
                //                   controller: _pageController,
                //                   count: 1,
                //                   effect: ExpandingDotsEffect(
                //                     activeDotColor:
                //                         Theme.of(context).primaryColor,
                //                     dotHeight: 10,
                //                     dotWidth: currentPage == index ? 20 : 3.5,
                //                     spacing: 5,
                //                     strokeWidth: 1,
                //                     paintStyle: (currentPage) == (index)
                //                         ? PaintingStyle.fill
                //                         : PaintingStyle.stroke,
                //                   ),
                //                 )
                //               : Container(
                //                   height: 12,
                //                   width: 12,
                //                   decoration: BoxDecoration(
                //                       border: Border.all(
                //                           color: Theme.of(context).primaryColor,
                //                           width: 1),
                //                       shape: BoxShape.circle),
                //                 ));
                //     },
                //   ),
                // ),
                // Container(
                //   alignment: Alignment.center,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: List.generate(
                //       pageCount,
                //       (index) {
                //         bool isSelected = currentPage == index;
                //         return AnimatedContainer(
                //           duration: const Duration(milliseconds: 8),
                //           curve: Curves.easeInOutSine,
                //           width: isSelected ? 35 : 11,
                //           height: isSelected ? 12 : 10,
                //           margin: const EdgeInsets.symmetric(horizontal: 5),
                //           decoration: BoxDecoration(
                //             shape:
                //                 isSelected ? BoxShape.rectangle : BoxShape.circle,
                //             borderRadius:
                //                 isSelected ? BorderRadius.circular(8) : null,
                //             color: isSelected
                //                 ? Theme.of(context).primaryColor
                //                 : Colors.transparent,
                //             border: Border.all(
                //               color: Theme.of(context).primaryColor,
                //               width: 0.5,
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: GradientElevatedButton(
                    text: 'Next',
                    onPressed: () {
                      (_pageController.page! < pageCount - 1)
                          ? {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              )
                            }
                          :  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const SignInScreen())
                        // RegistrationScreen.routename
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }

  Widget _buildmypage(String image, String boldtext, double leftpadding) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            const Positioned(
              top: 40,
              left: 0,

              child: Image(
                image: AssetImage('images/bgcolor.png',),
                width: 400,
                height: 380,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: leftpadding),
                child: Image(
                  image: AssetImage(image),
                  height: 390,
                )),
          ],
        ),
        BoldText(text: boldtext),
        const SizedBox(height: 15),
         Text(

                "You can access all verity of groceries\nhere and fast delivery service system",style: k14Grey700style,),
        // SizedBox(height: mediaquery.height * 0.03),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

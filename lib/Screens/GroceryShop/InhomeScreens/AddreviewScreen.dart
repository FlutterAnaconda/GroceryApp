import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/customappbar.dart';

import '../../../widgets/rating.dart';
import '../../../widgets/textfields/Descriptiontextfeild.dart';


class AddReviewScreen extends StatelessWidget {
  final String title;
  final String image;
  final int price;

  const AddReviewScreen({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MYDetailsappbar(
        text: 'Add Review',
        onpressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              SizedBox(
                height: 91,
                width: 325,
                child: Container(
                  decoration: cardcontainerdecoration,
                  child: Row(
                    children: [
                      image.contains('http')
                          ? Image.network(
                              image,
                              fit: BoxFit.contain,
                        height: 100,
                        width: 98,
                            )
                          : Image.asset(
                              image,
                              fit: BoxFit.contain,
                              height: 100,
                        width: 98,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left:16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                          const SizedBox(height: 12,),
                            Text(title,style: k16G600style,),
                            const SizedBox(height: 3,),
                            Row(
                              children: [
                                Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5 ),
                                  child: Text(
                                    '5.0',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                Text('(19)',
                                    style: k12Grey86400style),
                              ],
                            ),
                            const SizedBox(height: 5  ,),
                            Text(
                              '\$${price.toStringAsFixed(1)}',
                              style: k14B600style,
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const RatingCard(),
              const SizedBox(
                height:10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: DescriptionWidget(
                  description:
                      'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, consectetur adipiscing elit.consectetur adipiscing ',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GradientElevatedButton(text: 'Submit',onPressed:  () {
                Navigator.pop(context);
              }, ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCard extends StatefulWidget {
  const RatingCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RatingCardState createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Container(
        width: 340,
        decoration: cardcontainerdecoration,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
             Text('Your Overall rating of this product',style: k14B400fullstyle,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                color: Color(0xffEBEBF0),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: RatingBar.builder(
                unratedColor: const Color(0xffEBEBEB),
                initialRating: 1,
                glowRadius: 0,
                glow: true,
                glowColor: const Color(0xffFFFFFF),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Transform.scale(scale: 0.6,child: Image.asset( 'images/star3.png',color: const Color(0xffFFF743),)),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

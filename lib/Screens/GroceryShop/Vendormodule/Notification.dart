import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:dotcoder1/widgets/textfields/butons/outlinebutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/switchinprofilemodel.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MYDetailsappbar(
        text: 'Notifications',
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: noticardlist(context),
    );
  }
}
List<OneTextOneBool>list=[
  OneTextOneBool(text: 'bhai cipher',ischeck:  false),
  OneTextOneBool(text: 'fawad bangash',ischeck:  false),
  OneTextOneBool(text: 'fawad bangash',ischeck:  false),
  OneTextOneBool(text: 'fawad bangash',ischeck:  true),
  OneTextOneBool(text: 'fawad bangash',ischeck:  true),
  OneTextOneBool(text: 'fawad bangash',ischeck:  true),

];
Widget noticardlist(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ConversationScreen(
          //         imagepath: 'images/Group 1171276027.png',
          //         storetitle: 'Home Mart',
          //       ),
          //     )),
          child: Container(
            height: list[index].ischeck ==true ? 133:103,
            decoration: BoxDecoration(
              color: Colors.white, // Set the container background color
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 0.5,
                  color: Colors.black
                      .withOpacity(0.05)), // Optional: Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), // Shadow color
                  spreadRadius: 0, // Spread radius (controls the blur)
                  blurRadius: 2, // Blur radius
                  offset: const Offset(0, 2), // Offset in the x and y axes
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 4  ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Replace with your desired fixed width
              child: Row(

                children: [
                  const SizedBox(width: 8,),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/74/d3/83/74d383636f4f7d29b95ba18c9d66cfb4.jpg',
                    ),
                  ),
                  const SizedBox(width: 18,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 18.0,
                        ),
                        child: Text(
                          'Fawad Hussain',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xff727171),
                            size: 15,
                          ),
                          Text(
                            '91 park st road',
                            style: GoogleFonts.poppins(
                                color: const Color(0xffD6D6D6), fontSize: 10,fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Text(list[index].ischeck ==true ? 'This user want to buy something...':'Has given review on your product',style:  GoogleFonts.poppins(
                          color: const Color(0xff727171), fontSize: 12,fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            '17th Jan, 2023',
                            style: GoogleFonts.poppins(
                              fontSize: 11.09,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff9796A1),
                            ),
                          ),
                          Text(
                            '-- 03:20 AM',
                            style: GoogleFonts.poppins(
                              fontSize: 11.09,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xffC4C4C4),
                            ),
                          ),
                        ],
                      ),
                      list[index].ischeck ==true ? Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(width: 210,color: const Color(0xff9AA0B8).withOpacity(0.2),height: 1,),
                      ):const SizedBox(),
                      const SizedBox(height: 5,),
              list[index].ischeck ==true ? Row(
mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          const SizedBox(width: 85,),
                          SizedBox(width: 60,height: 24,child: Myoutlinebutton(isbold: false,fontsize: 10,height: 24,onTap: (){}, text: 'Reject')),
                         const SizedBox(width: 5,),
                          SizedBox(width: 60,child: GradientElevatedButton(text: 'Accept',isbold: false,fontsize: 10,height: 24, onPressed: (){})),

                        ],
                      ):const SizedBox(),
                    ],
                  ),

              list[index].ischeck ==true ? const SizedBox():Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset(
                      'images/settingicons/arrow.png',
                      width: 6,
                      height: 13,
                  fit: BoxFit.contain,
                    ),
              ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
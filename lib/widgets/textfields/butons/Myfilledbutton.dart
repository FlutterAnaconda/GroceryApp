import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  double? height;
  double? fontsize;
  bool? isbold;


   GradientElevatedButton({
    required this.text,
    required this.onPressed,
    this.height,
     this.fontsize,
     this.isbold =true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: height ?? 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            // const Color(0xff07CD6E),
            Color.fromRGBO(7, 205, 110, 1),
            Color.fromRGBO(5, 159, 85, 0.86)
            // const Color(0xFF059F55).withOpacity(0.86),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(isbold!?8.0:4.0),
      ),
      child: Material(
        color: Colors
            .transparent, // Important: Set the material color to transparent
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onPressed,
          splashColor:
              Colors.white.withOpacity(0.3), // Customize the splash color
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: fontsize??16,
                fontWeight:isbold!? FontWeight.w500:FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

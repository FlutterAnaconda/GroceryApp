import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BoldText extends StatelessWidget {
  final String text;
  const BoldText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(text,
      style:  GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 26,
        color: const Color(0xff2E2E2E)
      ),
    );
  }
}




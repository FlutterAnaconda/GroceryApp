import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text/constants.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: TextFormField(
        // readOnly: true,
        initialValue: description,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        maxLines: null,
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: k14Grey500style,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Color(0xffD6D8DA), // Your desired border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Color(0xffD6D8DA), // Your desired border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(18),
        ),
      ),
    );
  }
}

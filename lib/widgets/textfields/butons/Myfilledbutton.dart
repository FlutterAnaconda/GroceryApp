import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientElevatedButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  const GradientElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            const Color(0xFF059F55)
          ], // Customize your gradient colors
          begin: Alignment.topCenter, // Adjust the gradient's start position
          end: Alignment.bottomCenter, // Adjust the gradient's end position
        ),
        borderRadius:
            BorderRadius.circular(8.0), // Customize the border radius as needed
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors
              .transparent, // Set the button's background color to transparent
          elevation: 0, // Remove the default button elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8.0), // Match the container's border radius
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}

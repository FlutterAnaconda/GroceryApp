import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartQuantityWidget extends StatelessWidget {
  final int initialquantity;
  final ValueChanged<int> onQuantityChanged;

  const CartQuantityWidget(
      {super.key,
      required this.initialquantity,
      required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
        onTap: () {
      if (initialquantity > 0) {
        onQuantityChanged(initialquantity - 1);
      }},

          child: Container(
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color:   Color.fromARGB(250, 240, 249, 250),
              shape: BoxShape.circle,
            ),

            child: const Icon(Icons.remove, color: Colors.black),),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialquantity.toString(),
            style: GoogleFonts.dmSans(
              color: const Color(0xff06161C),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        GestureDetector(

          onTap: () {
            onQuantityChanged(initialquantity + 1);
          },
          child: Container(
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),

            child:  const Icon(Icons.add, color: Colors.white),


          ),
        ),
      ],
    );
  }
}





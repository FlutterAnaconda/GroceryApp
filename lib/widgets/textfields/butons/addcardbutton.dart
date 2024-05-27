import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../Screens/GroceryShop/InhomeScreens/addcardScreen.dart';

class DottedBorderButton extends StatelessWidget {
  const DottedBorderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width-  50,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddCardScreen()));
        },
        child: DottedBorder(
          color: const Color(0xFF07CD6E),
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [
            6,
            4
          ], // Define the dash pattern (6 is dash width, 4 is dash space)
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(
                  Icons.add,
                  color: Color(0xFF07CD6E),
                ),
                SizedBox(width: 8),
                Text(
                  'Add Card',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF07CD6E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

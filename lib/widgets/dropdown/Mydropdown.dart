import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropDownFormField extends StatefulWidget {
  final String hinttext;
  final List<String> list;
  final bool iscolorchanged;

  const MyDropDownFormField(
      {super.key,
      required this.hinttext,
      required this.list,
      required this.iscolorchanged});

  @override
  State<MyDropDownFormField> createState() => _MyDropDownFormFieldState();
}

class _MyDropDownFormFieldState extends State<MyDropDownFormField> {
  String _selectedItem = ''; // Default selected item

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.hinttext;
  }

  bool issizebox = false;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(

      icon: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Image.asset(
          'images/arrow3.png',
          height: 6,
          width: 12,
        ),
      ),
      decoration: InputDecoration(

          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
          border: const OutlineInputBorder(
            // Set Border to InputBorder.none to remove the underline
            borderSide: BorderSide.none,
          ),
          hintText: widget.hinttext,
          fillColor: widget.iscolorchanged
              ? const Color(0xffEBF8EE)
              : const Color(0xffF5F8F8),
          filled: true),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      value: _selectedItem,
      onTap: () {
        setState(() {
          issizebox = true;
        });
      },
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue!;
          issizebox = false;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value, // Ensure that each item has a unique value
          child: Text(
            value,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 12, color:const Color(0xffA8A8A8),

            ),
          ),
        );
      }).toList(),
    );
  }
}

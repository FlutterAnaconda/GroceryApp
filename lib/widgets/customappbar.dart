import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



// ignore: must_be_immutable
class MYDetailsappbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  VoidCallback? onpressed;
  MYDetailsappbar({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
      leading: GestureDetector(
        onTap: onpressed!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'images/Frame 36797.png',
            height: 5,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 45.0),
        child: Text(
          text,
          style:  GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w600,color: Colors.black),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ignore: must_be_immutable
class Mytypingappbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final VoidCallback? onpressed;
  final String imagepath;

  const Mytypingappbar({
    super.key,
    required this.text,
    this.onpressed,
    required this.imagepath,
  });

  final bool isonline = true;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
      leading: InkWell(
        onTap: onpressed!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'images/Frame 36797.png',
            height: 5,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Column(
        children: [
          Text(
            text,
            style:GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Active Now',
                style: k12darkgrey400,
              ),
              const SizedBox(
                width: 6,
              ),
              isonline
                  ? Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff19D715),
                      ),
                    )
                  : Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 206, 209, 206),
                      ),
                    )
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagepath),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Mycircleavatarappbar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final VoidCallback? onpressed;
  final String imagepath;


  const Mycircleavatarappbar({
    super.key,
    required this.text,
    this.onpressed,
    required this.imagepath,
  });

  @override
  State<Mycircleavatarappbar> createState() => _MycircleavatarappbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MycircleavatarappbarState extends State<Mycircleavatarappbar> {
  final bool isonline = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
      leading: GestureDetector(
        onTap: widget.onpressed!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'images/Frame 36797.png',
            height: 5,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(
        widget.text,
        style:GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child:CircleAvatar(
            backgroundImage: AssetImage(widget.imagepath),
          ),
        )
      ],
    );
  }

}

class Myfavappbar extends StatefulWidget implements PreferredSizeWidget {


  final VoidCallback onpressed;
  final String text;
  const Myfavappbar({
    super.key,
   required this.onpressed, required this.text,
  });

  @override
  State<Myfavappbar> createState() => _MyfavappbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyfavappbarState extends State<Myfavappbar> {

  bool isfav= false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
      leading: GestureDetector(
        onTap: widget.onpressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'images/Frame 36797.png',
            height: 5,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(
        widget.text,
        style:  GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color: Colors.black),
      ),
      actions: [
      IconButton(
        onPressed: () {
          setState(() {

            isfav = ! isfav;
            // Toggle favorite state
          });
        },
        icon: Image.asset(
          isfav
              ? 'images/fillheart.png'
              : 'images/heart.png',
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),

      ],
    );
  }

}
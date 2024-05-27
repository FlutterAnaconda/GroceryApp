

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

class VorderTabbar extends StatefulWidget {
  TabController tabController;

  final List tabs;

  VorderTabbar({super.key, required this.tabController, required this.tabs,});

  @override
  State<VorderTabbar> createState() => _VorderTabbarState();
}

class _VorderTabbarState extends State<VorderTabbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ButtonsTabBar(
          onTap: (e){
            print('==========================object');
            widget.tabs.length == 3?setState(() {

            }):null;
          },
          // Customize the appearance and behavior of the tab bar
          backgroundColor: const Color(0xffEFF9F1),

          borderWidth: 1,
          contentPadding: const EdgeInsets.symmetric(horizontal: 38),
          buttonMargin: const EdgeInsets.symmetric(horizontal: 4),
          borderColor: Colors.transparent,
          controller: widget.tabController,
          height: 30,
          splashColor: const Color(0xff34A853).withOpacity(0.1),
          unselectedBackgroundColor: Colors.white,
          unselectedBorderColor: const Color(0xffE8ECF2),
          labelStyle: GoogleFonts.poppins(
              color: const Color(0xff34A853),
              fontWeight: FontWeight.w400,
              fontSize: 12),
          unselectedLabelStyle: GoogleFonts.poppins(
              color: const Color(0xff888888),
              fontWeight: FontWeight.w400,
              fontSize: 12),
          // Add your tabs here
          tabs: widget.tabs.map((tab) {
            return Tab(
              text: tab,
            );
          }).toList(),
        ),
        widget.tabs.length == 3
            ? Positioned(
                left: widget.tabController.index == 0
                    ? 46
                    : widget.tabController.index == 1
                        ? 154
                        : widget.tabController.index == 2
                            ? 276
                            : 0,
                top: 23,
                child: circlecontainer(),
              )
            : Container(),
      ],
    );
  }

  Widget circlecontainer() => Container(
        height: 4,
        width: 4,
        decoration: const BoxDecoration(
          color: Color(0xff34A853),
          shape: BoxShape.circle,
        ),
      );
}


import 'package:dotcoder1/widgets/customappbar.dart';

import 'package:flutter/material.dart';


import '../../../../widgets/tabbar_tab/itemtab.dart';
import '../../../../widgets/tabbar_tab/vordertabbar.dart';

class Vordertab extends StatefulWidget {
  const Vordertab({super.key});

  @override
  State<Vordertab> createState() => _VordertabState();
}

class _VordertabState extends State<Vordertab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    _pageController.animateToPage(
      _tabController.index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

final List<String> tabs =  [ 'All(54)',
  'Pending(4)',
  'InProgress(12)',
  'Delivered(51)',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MYDetailsappbar(text: 'My Orders', onpressed: () {}),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16,),
                VorderTabbar(tabController: _tabController, tabs:  tabs),
              ],
            ),
          ),


          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                All(),
                Pending(),
                inprogress(),
                Delivered(),
              ],
              onPageChanged: (index) {
                _handleTabChange();           },
            ),
          ),
        ],
      ),
    );
  }
}

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TabBar(
//               isScrollable: true,
//               controller:
//               _tabController, // Explicitly set the TabController
//               tabs: tabs.map((tab) {
//                 return Tab(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: _tabController.index == tabs.indexOf(tab)
//                           ? const Color(0xffE8ECF2) // Selected tab background color
//                           : Colors.white,
//                       borderRadius: BorderRadius.circular(7),
//                       border: _tabController.index == tabs.indexOf(tab)
//                           ? null
//                           : Border.all(
//                         color: const Color(0xffE8ECF2),
//                         width: 1,
//                       ),
//                     ),
//                     child: Text(tab),
//                   ),
//                 );
//               }).toList(),
//                 // _tabController.index == tabs.indexOf(tab)
//               labelColor: const Color(0xff34A853),
//
//               unselectedLabelColor: const Color(0xff888888),
//               labelStyle: k12B400style,
// indicator: BoxDecoration(
//
//     ),
// //               indicatorSize: TabBarIndicatorSize.tab,
//               dividerColor: Colors.transparent,
//             ),
//           ),

import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/customappbar.dart';

import '../../../widgets/tabbar_tab/itemtab.dart';
import '../../../widgets/tabbar_tab/mytabindicator.dart';
import '../../../widgets/tabbar_tab/store_tab.dart';
import '../../../widgets/text/constants.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    _pageController.animateToPage(
      _tabController.index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MYDetailsappbar(
          text: 'Favorite',
          onpressed: () => Navigator.pop(context),
        ),
        // onpressed: () => Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const HomeScreen(),
        //     ))),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        16.0), // Adjust border radius as needed
                    color: const Color(0xffEDF8F0)),
                child: TabBar(

                  controller:
                      _tabController, // Explicitly set the TabController
                  tabs: const [
                    Tab(text: 'Items'),
                    Tab(text: 'Orders'),
                  ],

                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xffACAAAA),
                  labelStyle: k14Grey500style,
                  indicator: CustomTabIndicator(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  items(),
                  const Stores(),
                ],
                onPageChanged: (index) {
                  _tabController.index = index;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

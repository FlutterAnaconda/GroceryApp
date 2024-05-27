import 'dart:developer';

import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/VendorhomeScreen.dart';
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/tabbar_tab/vordertabbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../../models/saletabmodel.dart';
import '../../../../widgets/tabbar_tab/itemtab.dart';
import '../../../../widgets/tabbar_tab/salestab_tabs.dart';

class Saletab extends StatefulWidget {
  const Saletab({super.key});

  @override
  State<Saletab> createState() => _SaletabState();
}

class _SaletabState extends State<Saletab> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController _pageController;
  static const List<SalestabModel> stringlist = [
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
  ];

  final List<String> tabs = [
    'All',
    'Sales',
    'Withdraw',
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
    tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    _pageController.animateToPage(
      tabController.index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: Mycircleavatarappbar(
          text: 'My Sale',
          imagepath: 'images/Group 7066.png',
          onpressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (c) => const VendorhomeScreen(),
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                      color: const Color(0xffEFF9F2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 1.5,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // mainAxisAlignment:MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, top: 20),
                            child: Text(
                              'Total Amount',
                              style: k18B500style,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, top: 20),
                            child: Text(
                              '\$1200',
                              style: k24G600style,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          log('_tabController.index${tabController.index}');
                          log('_pageController.page!${_pageController.page!}');
                          if(tabController.index == _pageController.page!.toInt() )
                          {

                           print('true');
                          }
                        },
                        child: Image.asset(
                          'images/salesdisplay.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    VorderTabbar(tabController: tabController, tabs:  tabs),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 340,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    AllSales_withdarw(),
                    Sales(),
                    Withdraw(),
                  ],
                  onPageChanged: (index) {
                   _handleTabChange();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GradientElevatedButton(text: 'Withdraw', onPressed: () {}),
        ),
      ),
    );
  }

  Widget AllSales_withdarw() => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: stringlist.length,
        itemBuilder: (context, index) {
          final int color;
          if (stringlist[index].imagepath == 'images/up.png') {
            color = 0xff34A853;
          } else {
            color = 0xffB62D2D;
          }
          return MySalesTabCard(
              imagepath: stringlist[index].imagepath,
              maintext: stringlist[index].maintext,
              datetime: stringlist[index].datetime,
              amount: stringlist[index].amount,
              color: color);
        },
      );

  Widget Sales() => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: stringlist.length,
        itemBuilder: (context, index) {
          if (stringlist[index].imagepath != 'images/up.png') {
            return Container();
          }

          return MySalesTabCard(
              imagepath: stringlist[index].imagepath,
              maintext: stringlist[index].maintext,
              datetime: stringlist[index].datetime,
              amount: stringlist[index].amount,
              color: 0xff34A853);
        },
      );

  Widget Withdraw() => SizedBox(

        height: MediaQuery.of(context).size.height - 406,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          itemCount: stringlist.length,
          itemBuilder: (context, index) {
            if (stringlist[index].imagepath == 'images/up.png') {
              return Container();
            }

            return MySalesTabCard(
                imagepath: stringlist[index].imagepath,
                maintext: stringlist[index].maintext,
                datetime: stringlist[index].datetime,
                amount: stringlist[index].amount,
                color: 0xffB62D2D);
          },
        ),
      );
}

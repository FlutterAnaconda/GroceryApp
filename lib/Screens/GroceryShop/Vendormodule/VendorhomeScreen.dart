import 'package:flutter/material.dart';

import '../Bottomtab/Settingtab.dart';
import 'vendorbottomtab/addproducttab.dart';
import 'vendorbottomtab/saletab.dart';
import 'vendorbottomtab/vhometab.dart';
import 'vendorbottomtab/vordertab.dart';



class VendorhomeScreen extends StatefulWidget {

   const VendorhomeScreen({super.key,});

  @override
  State<VendorhomeScreen> createState() => _VendorhomeScreenState();
}

class _VendorhomeScreenState extends State<VendorhomeScreen> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    const VHometab(),
    const Vordertab(),
    const Addproducttab(isupdate: false),
    const Saletab(

    ),
    const SettingTab(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _currentIndex = widget.selectTab ==3?3:_currentIndex;

    return SafeArea(
      child: Scaffold(
        // widget.selectTab ==3?tabs[widget.selectTab!]:
        body: tabs[_currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.white,
            highlightColor: Colors.white,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
      //  if (widget.selectTab!=_currentIndex) {
      //   setState(() {
      //
      //
      //     _currentIndex = widget.selectTab!;
      //   });
      // }
      //  else {
           setState(() {
             _currentIndex = index;
           });

       },
            selectedItemColor:
            Theme.of(context).primaryColor, // Color for the active tab item.
            unselectedItemColor: Colors.grey, // Color for the inactive tab items.
            showUnselectedLabels:
            true, // Set this to false to hide the inactive tab labels.
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                    _currentIndex == 0
                        ? 'images/homefill.png'
                        : 'images/home-2.png',
                    height: 24,
                    width: 24),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    _currentIndex == 1
                        ? 'images/orderfill.png'
                        : 'images/clipboard-text.png',
                    height: 24,
                    width: 24),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon:
                Image.asset('images/add.png', height: 50, width: 50),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    _currentIndex == 3
                        ? 'images/fillsale.png'
                        : 'images/sale.png',
                    height: 24,
                    width: 24),
                label: 'Sales',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    _currentIndex == 4
                        ? 'images/settingicons/setting-2.png'
                        : "images/settingicons/setting.png",
                    height: 24,
                    width: 24),
                label: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

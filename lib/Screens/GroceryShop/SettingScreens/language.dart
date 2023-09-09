import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../../../models/paymentmethod.dart';
import '../../../widgets/text/constants.dart';

// ignore: must_be_immutable
class LangScreen extends StatefulWidget {
  LangScreen({
    super.key,
  });
  static const List<PaymentMethodModel> list = [
    PaymentMethodModel('images/arabia.png', 'Arabic'),
    PaymentMethodModel('images/us.png', 'English'),
    PaymentMethodModel('images/pak.png', 'Urdu'),
  ];

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: MYDetailsappbar(
            text: 'Language',
            onpressed: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: LangScreen.list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 64,
                        width: 332,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: cardcontainerdecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              LangScreen.list[index].imageurl,
                              width: 24,
                              height: 24,
                            ),
                            Text(LangScreen.list[index].text),
                            const SizedBox(
                              width: 100,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedindex = index;
                                });

                                // print(selectedindex);
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 2,
                                      color: selectedindex == index ?Theme.of(context).primaryColor:const Color(0xffC4C4C4),
                                    )),
                                child: selectedindex == index
                                    ? Icon(
                                        Icons.circle,
                                        color: Theme.of(context).primaryColor,
                                        size: 11,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

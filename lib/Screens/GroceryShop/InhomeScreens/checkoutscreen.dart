import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/paymentmethod.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/checkoutmodel.dart';

import '../../../widgets/Stepper/Stepper.dart';

import '../../../widgets/dropdown/Mydropdown.dart';

import '../../../widgets/textfields/textfield.dart';
import 'SearchScreens/locationScreen.dart';

class CheckOutScreen extends StatefulWidget {
  final double total;

  const CheckOutScreen({super.key, required this.total});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int? _currentPage;

  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final PageController _contentPageController = PageController(initialPage: 0);

  // int? selectedCardIndex;

  List<CheckoutModel> deliverywidgetform = [
    CheckoutModel("Full Name", TextEditingController()),
    CheckoutModel("Phone Number", TextEditingController()),
    CheckoutModel("Address", TextEditingController()),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _contentPageController.addListener(() {
      setState(() {
        _currentPage = _contentPageController.page!.toInt();
        // print("Currrnet page $_currentPage");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MYDetailsappbar(
        text: 'Check out',
        onpressed: (){ _currentPage! > 0?
        _contentPageController.previousPage(duration: const Duration(milliseconds: 250 ), curve: Curves.linear):
        Navigator.pop(context);},
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Mystepper(
                  currentindex: _currentPage,
                  firsttext: 'Delivery',
                  thridtext: 'Payment',
                  secondtext: 'Address', isdummyneeded: true,),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                controller: _contentPageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  addresswidget(() {
                    _contentPageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  }),
                   PaymentScreen(
                    onPressed: () {
                      _contentPageController.nextPage(
                          duration:
                          const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool issave = false;
  final List<String> list=['Delivery',
    'Item 2',
    'Item 3',
    'Item 4',];

  Widget addresswidget(Function ontap) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.79,
                      child:  Padding(
                        padding: const EdgeInsets.only(right: 4.0, left: 18),
                          child: MyDropDownFormField(hinttext: 'Delivery',list: list, iscolorchanged: false,),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PickLocationScreen(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Container(
                          height: 56,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffF5F8F8),
                            // border: OutlinedBorder(
                            //   borderRadius: BorderRadius.circular(8.0),
                            //   borderSide: BorderSide.none,
                          ),
                          child: Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            child: Image.asset(
                              width:
                              17, // Adjust the image width within the container
                              height: 21,
                              'images/location.png',

                              fit: BoxFit.contain,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 225,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: deliverywidgetform.length,
                  itemBuilder: (context, index) {
                    TextInputType keyboardType =
                        TextInputType.text; // Default keyboard type

                    // Check if the current field is a phone number field
                    if (deliverywidgetform[index].label == 'Phone Number') {
                      keyboardType = TextInputType.phone;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8),
                      child: MyTextFormField(
                        controller: deliverywidgetform[index].controller,
                        labelText: deliverywidgetform[index].label,
                        name: deliverywidgetform[index].label,
                        mykeyboardType: keyboardType,
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: MyTextFormField(
                    controller: zipCodeController,
                    labelText: 'Zipcode',
                    name: 'Zipcode',
                  ),
                ),
                Expanded(
                  child: MyTextFormField(
                    controller: cityController,
                    labelText: 'City',
                    name: 'City',
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 10,bottom: 15),
                child: Row(
                  children: [
                 
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          issave = !issave;
                        });

                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
           borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: issave
                                ? Colors.transparent
                                : Colors.grey,
                          ),
                          gradient: issave
                              ? LinearGradient(
                            colors: [
                              const Color(0xff07CD6E),
                              const Color(0xFF059F55).withOpacity(0.86),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                              : null,
                        ),
                        child: Center(
                          child: issave
                              ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Text("Save shipping address",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 215,
              child: Container(
                decoration: typingcardcontainerdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 5),
                          child: Text(
                            "Details",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,top:20.0),
                          child: Row(
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff6F6B6B),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '\$${widget.total.toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff6F6B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0,top: 4),
                          child: Row(
                            children: [
                              Text(" Delivery free for 3.6km",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black)),
                              const Spacer(),
                              Text("+12.70",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45.0,left: 12 ),
                          child: GradientElevatedButton(
                              onPressed: () {
                                _contentPageController.nextPage(
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              },
                              text: 'Next'),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      );
}

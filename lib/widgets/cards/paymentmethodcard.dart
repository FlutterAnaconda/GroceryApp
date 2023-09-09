import 'package:flutter/Material.dart';

import '../../models/paymentmethod.dart';



// ignore: must_be_immutable
class Paymentmethodcard extends StatefulWidget {



  const Paymentmethodcard({
    Key? key,


  }) : super(key: key);
 static const List<PaymentMethodModel> paymethod = [
    PaymentMethodModel("images/m3.png", "Cash on Delivery",),
    PaymentMethodModel("images/m1.png", "Paypal",),
    PaymentMethodModel("images/m2.png", "MasterCard",),
  ];

  @override
  State<Paymentmethodcard> createState() => _PaymentmethodcardState();
}

class _PaymentmethodcardState extends State<Paymentmethodcard> {
  int selectedPaymentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 255,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child:  GestureDetector(
                onTap:  () {
                  setState(() {
                    selectedPaymentIndex = index; // Update the selected index
                  });
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 74,
                          width: 300,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the container background color
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 0.5,
                                color: Colors.black
                                    .withOpacity(0.05)), // Optional: Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1), // Shadow color
                                spreadRadius: 0, // Spread radius (controls the blur)
                                blurRadius: 2.84415602684021, // Blur radius
                                offset: const Offset(0, 2), // Offset in the x and y axes
                              ),
                            ],
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(Paymentmethodcard.paymethod[index].text),
                              ),
                              const Spacer(),
                              AnimatedContainer(
                                alignment: Alignment.center,
                                duration: const Duration(milliseconds: 200),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  gradient:  selectedPaymentIndex == index
                                      ? const LinearGradient( colors: [
                                    // const Color(0xff07CD6E),
                                    Color.fromRGBO(7, 205, 110, 1),
                                    Color.fromRGBO(5, 159, 85, 0.86)
                                    // const Color(0xFF059F55).withOpacity(0.86),
                                  ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,)
                                      : null,
                                  border: Border.all(color:  selectedPaymentIndex == index?Theme.of(context).primaryColor:const Color(0xffAAAAAA)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: selectedPaymentIndex == index
                                    ? const Icon(Icons.check, color: Colors.white ,size: 15,weight: 10,)
                                    : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 5,
                      child: Container(
                        height: 60.16,
                            width: 59.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff0075FF).withOpacity(0.10),
                                  offset: const Offset(3.698965072631836,2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Image.asset(
                            Paymentmethodcard.paymethod[index].imageurl,
                            scale: 3.5,
                            // fit: BoxFit.fill,
                          ), // Replace with your image
                        ),
                      ),
                    ),
                  ],
                ),
              )
              );

          },
        ));





  }
}

// ignore: must_be_immutable
// class SmoothCheckBox extends StatefulWidget {
//    final int selectedindex;
//    final int index;
//    bool? isSelected;
//
//    SmoothCheckBox({super.key,  this.isSelected, required this.selectedindex, required this.index, });
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _SmoothCheckBoxState createState() => _SmoothCheckBoxState();
// }

// class _SmoothCheckBoxState extends State<SmoothCheckBox> {
//    bool? ischecked;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//            ischecked =   widget.selectedindex ==  widget.index;
//            widget.isSelected=ischecked;
//         });
//
//       },
//       child:
//     );
//   }
// }

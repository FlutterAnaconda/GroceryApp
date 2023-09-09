import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/cartprovider.dart';
import '../../../models/cart_item.dart';

import '../../../widgets/customappbar.dart';
import '../../../widgets/text/constants.dart';

import '../InhomeScreens/checkoutscreen.dart';
import '../homeScreen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final bool islarge;

  const CartScreen({super.key, required this.cartItems, required this.islarge});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // print('state rebuild');
    final cartProvider = Provider.of<CartProvider>(context);
    List<CartItem> cartItems = cartProvider.cartItems;

    return Scaffold(
      body: Scaffold(
        backgroundColor:
            // Colors.white,
            const Color(0xff23AA49).withOpacity(0.07),
        appBar: MYDetailsappbar(
          text: 'Cart',
          onpressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen())),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: (cartItems.length <=2)? MediaQuery.of(context).size.height-400:null,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    CartItem item = cartItems[index];

                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 70,
                              height: 110,
                              child: Container(
                                alignment: Alignment.center,
                                height: 24,
                                width: 22,
                                child: Image.asset(
                                  'images/delicon.png',
                                  height: 24,
                                  width: 22,
                                  fit: BoxFit.contain,
                                ),
                              )),
                        ),
                      ),
                      onDismissed: (_) {
                        cartProvider.removeFromCart(item);

                        Fluttertoast.showToast(
                          msg: "Item removed from cart!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Container(
                          height: 122,
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Set the container background color
                            borderRadius: BorderRadius.circular(
                                9), // Optional: Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.05), // Shadow color
                                spreadRadius:
                                    0, // Spread radius (controls the blur)
                                blurRadius: 3, // Blur radius
                                offset: const Offset(
                                    0, 2), // Offset in the x and y axes
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item.title,
                                        style: k16B600style,
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        item.title,
                                        style: k14Grey500style,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        '\$${item.price.toStringAsFixed(1)}',
                                        style: k16G600style,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                              Positioned(
                                bottom: 0,
                                right: 10,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cartProvider.decrementQuantity(item);
                                        // Fluttertoast.showToast(
                                        //   msg: "Item quantity decreased!",
                                        //   toastLength: Toast.LENGTH_SHORT,
                                        //   gravity: ToastGravity.BOTTOM,
                                        //   timeInSecForIosWeb: 1,
                                        //   backgroundColor:
                                        //       Theme.of(context).primaryColor,
                                        //   textColor: Colors.white,
                                        //   fontSize: 14.0,
                                        // );
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: Color(0xff6D3805),
                                      ),
                                    ),
                                    Text(
                                      '${item.quantity}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff6D3805),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cartProvider.incrementQuantity(item);
                                        // Fluttertoast.showToast(
                                        //   msg: "Item quantity increased!",
                                        //   toastLength: Toast.LENGTH_SHORT,
                                        //   gravity: ToastGravity.BOTTOM,
                                        //   timeInSecForIosWeb: 1,
                                        //   backgroundColor:
                                        //       Theme.of(context).primaryColor,
                                        //   textColor: Colors.white,
                                        //   fontSize: 16.0,
                                        // );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Color(0xff6D3805),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 5,
                                bottom: 52,
                                child: item.image.contains('http')
                                    ? SizedBox(
                                        height: 88,
                                        width: 180,
                                        child: Image.network(
                                          item.image,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 88,
                                        width: 180,
                                        child: Image.asset(
                                          item.image,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (cartItems.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 205,
                    child: Container(
                      decoration: typingcardcontainerdecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
                              child: Text(
                                "Details",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Total",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${cartProvider.calculateTotalPrice(cartItems).toStringAsFixed(2)}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Text(" Delivery free for 3.6km",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  const Spacer(),
                                  Text("+\$12.70",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GradientElevatedButton(
                              text: 'Check Out',
                              onPressed: () {
                                if (cartProvider
                                        .calculateTotalPrice(cartItems) >
                                    0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CheckOutScreen(
                                                total: cartProvider
                                                    .calculateTotalPrice(
                                                        cartItems),
                                              )));
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'please Select items',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add  Items to the cart',
                      style: k22B500style,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

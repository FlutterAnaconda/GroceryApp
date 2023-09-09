import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/AddreviewScreen.dart';
import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/reviewScreen.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/cartprovider.dart';
import '../../../models/cart_item.dart';
import '../../../widgets/cartQuantity.dart';
import '../../../widgets/customappbar.dart';
import '../../../widgets/listveiwbuilders/Reviewlistveiw.dart';
import '../../../widgets/text/constants.dart';
import '../../../widgets/text/homerowtext.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routename = '/ProductDetailsScreen';
  final String title;
  final String image;
  final int price;
  final String location;
  final String subtitle;
  const ProductDetailsScreen({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.title, required this.subtitle,
  });
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isAssetimage = true;
  bool isfav = false;

  void addToCart() {
    if (cartQuantity > 0) {
      CartItem newItem = CartItem(
        title: widget.title,
        image: widget.image,
        price: widget.price,
        quantity: cartQuantity,
      );
      final cartProvider = Provider.of<CartProvider>(context, listen: false);
      cartProvider.addToCart(newItem);

      // Set the cartQuantity to 0 in the parent widget to clear the text.
      setState(() {
        cartQuantity = 0;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Quantity should be at least 1",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void initState() {
    if (widget.image.contains('https')) {
      setState(() {
        isAssetimage = false;
      });
    }
    super.initState();
  }

  int cartQuantity = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: Myfavappbar(
              text: 'Product Details', onpressed: () => Navigator.pop(context)),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 250,
                      width: double.infinity,

                      child: isAssetimage
                          ? Image.asset(
                              widget.image,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              widget.image,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.fill,
                            ),
                    ),

                    const SizedBox(
                      height: 65,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.05),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            ' ${widget.title}',
                            style: k22B600style,
                          ),
                          const Spacer(),
                          Text(
                            ' \$${widget.price.toStringAsFixed(1)}',
                            style: k20B600style,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,top: 4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 17.8,
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            widget.location,
                            style: k12_4B_49_400style,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildMinorDetail(
                                '45minutes',
                               'images/vespa.png',
                                context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildMinorDetail('80 kcal,100 gm',
                                'images/drop.png', context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildMinorDetail('80 kcal,100 gm',
                                'images/leaf.png', context),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddReviewScreen(
                                      image: widget.image,
                                      price: widget.price,
                                      title: widget.title,
                                    ))),
                        child: Text(
                          'Add Review',
                          style: k10G400underlinestyle,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Description',
                        style: k16B500style,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                      child: Text(
                        'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, consectetur adipiscing elit . consectetur adipiscing ',
                        style: k14Grey9C500style,
                      ),
                    ),
                    Myhomerowtext(
                        text: 'Reviews',
                        ontap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ReviewsBuilderScreen()))),
                    const ReviewsBuilder(),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0),
                  child: GradientElevatedButton(
                    onPressed: () {
                      addToCart();
                    },
                    text: 'Add to Cart',
                  ),
                ),
                    const SizedBox(height: 10,),
                  ],
                ),
                Positioned(
                  top: 255,
                  right: 10,
                  child: CartQuantityWidget(
                    initialquantity: cartQuantity,
                    onQuantityChanged: (newQuantity) {
                      setState(() {
                        cartQuantity = newQuantity;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          ));

  }
}

Widget buildMinorDetail(
    String text, String imagepath, BuildContext context) {
  // final mediaqurey = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      constraints: const BoxConstraints(
        minWidth: 112,
        maxWidth: 129,
      ),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        color:const Color(0xffF3FAF5).withOpacity(0.66),
      ),
      height:40,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Image.asset(
              imagepath,
             width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 11, color: const Color(0xff958F8F)),
            ),
          ],
        ),
      ),
    ),
  );
}

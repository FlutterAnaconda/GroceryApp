import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/vendorbottomtab/addproducttab.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/tabbar_tab/itemtab.dart';
import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../../widgets/textfields/butons/outlinebutton.dart';

class VendorTabbarconent extends StatefulWidget {
  const VendorTabbarconent({super.key});

  @override
  State<VendorTabbarconent> createState() => _VendorTabbarconentState();
}

class _VendorTabbarconentState extends State<VendorTabbarconent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        ProductModel originalItem = list[index];
        return Slidable(
          key: UniqueKey(),
          direction: Axis.horizontal,
          endActionPane: ActionPane(
            key: UniqueKey(),
            dragDismissible: true,
            dismissible: DismissiblePane(onDismissed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    title: const Text("Alert...!"),
                    content: const Text("Are you Sure to Delete."),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GradientElevatedButton(
                              onPressed: () {

                                setState(() {
                                  list[index] == originalItem;
                                });
                                Navigator.pop(context);
                              },
                              text: 'Cancel',
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Myoutlinebutton(
                              height: 50,
                              onTap: () {
                                setState(() {
                                  list.removeAt(index);
                                  Navigator.pop(context);
                                });
                                Fluttertoast.showToast(
                                  msg: "Item Deleted !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              },
                              text: 'Delete',
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              );
            }),
            motion: const ScrollMotion(),
            children: [
              Flexible(
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.02), width: 0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    width: 70,
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) =>
                                      const Addproducttab(isupdate: true),
                                ));
                          },
                          child: Image.asset(
                            'images/edit.png',
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  title: const Text("Alert...!"),
                                  content: const Text("Are you Sure to Delete."),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GradientElevatedButton(
                                            onPressed: () {

                                              setState(() {
                                                list[index] == originalItem;
                                              });
                                              Navigator.pop(context);
                                            },
                                            text: 'Cancel',
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Myoutlinebutton(
                                            height: 50,
                                            onTap: () {
                                              setState(() {
                                                list.removeAt(index);
                                                Navigator.pop(context);
                                              });
                                              Fluttertoast.showToast(
                                                msg: "Item Deleted !",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            },
                                            text: 'Delete',
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'images/delicon.png',
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the container background color
              borderRadius:
                  BorderRadius.circular(9), // Optional: Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  spreadRadius: 0, // Spread radius (controls the blur)
                  blurRadius: 3.5630252361297607, // Blur radius
                  offset: const Offset(
                      0, 1.7815126180648804), // Offset in the x and y axes
                ),
              ],
            ),
            margin: const EdgeInsets.all(8),
            child: Stack(
              children: [
                list[index].discount!
                    ? Positioned(
                        right: 20,
                        child: Container(
                          width: 35,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                list[index].price! == 25
                                    ? 'images/yellow.png'
                                    : 'images/green.png',
                              ),
                              fit: BoxFit.cover, // Adjust the fit to your needs
                            ),
                          ),
                        ))
                    : Container(),
                SizedBox(
                  height: 100, // Replace with your desired fixed width
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9)),
                        child: Image.asset(
                          list[index].image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].title!,
                            style: GoogleFonts.poppins(
                              fontSize: 16.03,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff34A853),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/star1.png',
                                width: 14.25,
                                height: 14.25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 2.0, left: 6),
                                child: Text(
                                  list[index].rating!.toStringAsFixed(1),
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, fontWeight: FontWeight.w400
                                      // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Text(
                                '(24)',
                                style: k12lightgrey400,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.52,
                              child: Row(
                                children: [
                                  Text(
                                    list[index].outofstock!
                                        ? 'Out Of Stock'
                                        : 'Quantity : \$${list[index].quantity!}',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xff9796A1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.09,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Text(
                                      '\$${list[index].price!.toStringAsFixed(1)}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/textfield.dart';

class Newpassword extends StatefulWidget {
  static const String routename = '/Newpassword';

  const Newpassword({Key? key}) : super(key: key);

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool showpass = true;
  bool showpass1 = true;
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: mediaquery.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Image(
                  image: AssetImage('images/registerimage.png'),
                  height: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                 Text( "Forgot Password",style: k24B600style,),
                const SizedBox(
                  height: 15,
                ),
                 Text(

                        "   Enter your new password\n for accessing your account",style: k14Grey400style,),
                const SizedBox(
                  height: 50,
                ),
                MyTextFormField(
                  obscure: showpass,
                  name: 'Password', // Assign a name to the form field
                  labelText: 'Password',
                  controller: _passwordController,
                  suffixicon: GestureDetector(
                      onTap: () {
                        showpass = !showpass;
                        setState(() {});
                      },
                      child: showpass
                          ? Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              child: Image.asset(
                                width:
                                    20, // Adjust the image width within the container
                                height: 20,
                                'images/eye.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          :  Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Image.asset(
                          width:
                          20, // Adjust the image width within the container
                          height: 20,
                          'images/filleye.png',
                          fit: BoxFit.contain,
                        ),
                      ),),
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextFormField(
                  obscure: showpass1,
                  name: 'ConfirmPassword', // Assign a name to the form field
                  labelText: 'ConfirmPassword',
                  controller: _confirmPasswordController,
                  suffixicon: GestureDetector(
                      onTap: () {
                        showpass1 = !showpass1;
                        setState(() {});
                      },
                      child: showpass1
                          ? Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              child: Image.asset(
                                width:
                                    20, // Adjust the image width within the container
                                height: 20,
                                'images/eye.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Image.asset(
                          width:
                          20, // Adjust the image width within the container
                          height: 20,
                          'images/filleye.png',
                          fit: BoxFit.contain,
                        ),
                      ),),
                ),
                const SizedBox(
                  height: 25,
                ),
                GradientElevatedButton(
                  text: 'Forgot',
                  onPressed: () {
                    // Perform form submission
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

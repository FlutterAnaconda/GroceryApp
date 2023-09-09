import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/registration_screen.dart';
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/Screens/onboarding/RegisterAccount.dart';
import 'package:dotcoder1/widgets/text/constants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Providers/usertype.dart';

import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/butons/loginwithbutton.dart';
import '../../widgets/textfields/textfield.dart';
import '../GroceryShop/Vendormodule/VendorhomeScreen.dart';
import 'forgotpasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  static const String routename = '/SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool showpass = true;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final whichuser = Provider.of<Usertype>(context);

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
                  const Stack(
                    children: [

                      Image(
                        image: AssetImage('images/registerimage.png'),
                        height:100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text( "Sign In",style: k24B600style,),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(

                          "   Enter your information \n for accessing your sign in",style: k14Grey400style,),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextFormField(
                    name: 'Email', // Assign a name to the form field
                    labelText: 'Email',
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 5,
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
                        ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            overlayColor: MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () => Navigator.pushNamed(
                              context, ForgotScreen.routename),
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                                color:const Color(0xff059F55).withOpacity(0.86),
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GradientElevatedButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => whichuser.isuser!?const HomeScreen(): const VendorhomeScreen())
                          //  HomeScreen.routename
                          );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "--OR--",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyLoginWithButton(
                      onTap: () => print("button pressed"),
                      text: 'Continue with google',
                      iconUrl: 'images/google.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyLoginWithButton(
                      onTap: () => print("button pressed"),
                      text: 'Continue with Facebook',
                      iconUrl: 'images/fb.png'),
                  const SizedBox(
                    height: 38,
                  ),
                  SizedBox(
                    width: mediaquery.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I don’t have an account?',
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w600

                          ),
                        ),
                        GestureDetector(

                          // style: ButtonStyle(
                          //
                          //   overlayColor: MaterialStateProperty.resolveWith((states) {
                          //     if(states.contains(MaterialState.pressed))
                          //       {
                          //         return Colors.white;
                          //       }
                          //   }),
                          //  // fixedSize: MaterialStateProperty.all(const Size(30, 40)),
                          // ),
                          onTap: () {
                            whichuser.isuser!?
                            Navigator.pushReplacementNamed(
                                context, RegistrationScreen.routename):Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                 return const VendorRegistration();
                                },));
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.quicksand(
                              color: const Color(0xff059F55).withOpacity(0.86),
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xff059F55).withOpacity(0.86),
                              fontSize: 14,
                              fontWeight: FontWeight.w600


                          ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}

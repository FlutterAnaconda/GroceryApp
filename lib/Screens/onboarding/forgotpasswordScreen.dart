import 'package:dotcoder1/Screens/onboarding/newpassword.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';


import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/textfield.dart';

class ForgotScreen extends StatefulWidget {
  static const String routename = '/ForgotScreen';
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          const Image(
            image: AssetImage('images/registerimage.png'),
            height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
           Text( "Forgot Password",style: k24B600style,),
          const SizedBox(
            height: 5,
          ),
           Text(
               "     Enter your email for\n changing your password",style: k14Grey400style,),
          const SizedBox(
            height: 50,
          ),
          MyTextFormField(
            name: 'Email', // Assign a name to the form field
            labelText: 'Email',
            controller: _nameController,
          ),
          const SizedBox(
            height: 30,
          ),
          GradientElevatedButton(
            text: 'Next',
            onPressed: () {
              Navigator.pushNamed(context, Newpassword.routename);
            },
          ),
        ]),
      ),
    );
  }
}

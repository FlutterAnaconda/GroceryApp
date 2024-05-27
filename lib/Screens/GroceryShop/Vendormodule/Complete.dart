import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textfields/butons/outline_to_fill_button.dart';
class CompleteScreen extends StatefulWidget {
  final VoidCallback onslide;
  const CompleteScreen({super.key, required this.onslide});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  bool isTapped=true;
  bool isTapped1=false;

  void _onButtonTap() {
    setState(() {
      isTapped = !isTapped;
      isTapped1=false;
    });

  }
  void onButtonTap1() {
    setState(() {
     isTapped=false;
      isTapped1 = !isTapped1;
    });


  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
            children: [
 SizedBox(height: MediaQuery.of(context).size.height*0.30,),
              Mytrialbutton(isTapped: isTapped,ontap: (){
                _onButtonTap();

              },text: 'Continue With 7 Days free trial',),
              const SizedBox(height: 20,),
              Mytrialbutton(isTapped: isTapped1,ontap: (){
                onButtonTap1();


              },text: 'Pay Manually',),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                child: GradientElevatedButton(text: 'Next', onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

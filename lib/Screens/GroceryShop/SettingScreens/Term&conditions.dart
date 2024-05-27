import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../../widgets/textfields/butons/outlinebutton.dart';

class TermconScreen extends StatefulWidget {
  const TermconScreen({
    super.key,
  });

  @override
  State<TermconScreen> createState() => _TermconScreenState();
}

class _TermconScreenState extends State<TermconScreen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MYDetailsappbar(
        text: 'Term & Conditions',
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Use of Platform & Services',
                style: k16G600,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing\n elit. Etiam eu turpis molestie, dictum est a, mattis\ntellus. Sed dignissim, metus nec fringilla accumsan,\n risus sem sollicitudin lacus, ut interdum tellus elit sed \nrisus. Maecenas eget condimentum velit, sit amet feugiat lectus.\n Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. \nPraesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar.\n Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem.\n Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                style: k14lightgery400style,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Personal Information that you provide',
                style: k16lightblack600style,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per. ',
                style: k14lightgery400style,
              ),
              Text(
                'Cancelation',
                style: k16lightblack600style,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus. ',
                style: k14lightgery400style,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        ischecked = !ischecked;
                      });

                    },
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: ischecked
                              ? const Color(0xFF07CD6E)
                              : Colors.grey,
                        ),
                        gradient: ischecked
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
                        child: ischecked
                            ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                            : null,
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'I agree with this',
                    style: k14Grey300style,
                  ),
                  Text(
                    ' Terms & Conditions',
                    style: k14darkGrey500style,
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(

                      child: GradientElevatedButton(
                        onPressed: () {
                          if (ischecked == false) {
                            Fluttertoast.showToast(
                              msg: 'please accept Term&Condition',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        text: 'Accept',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(

                      child: Myoutlinebutton(
                        height: 50,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

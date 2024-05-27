import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Mystepper extends StatelessWidget {
  int? currentindex;
  final String firsttext;
  final String secondtext;
  final String thridtext;
  final bool isdummyneeded;
  Mystepper({super.key, this.currentindex, required this.firsttext, required this.secondtext, required this.thridtext, required this.isdummyneeded});

  @override
  Widget build(BuildContext context) {
    return stepperwidget(context);
  }

  Widget stepperwidget(BuildContext context) => SizedBox(
        height: 68,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // _buildStepperIcon(0),
                  isdummyneeded?_buildDummyStepper(context):_buildStepperIcon(0, context,isdummyneeded),
                  Expanded(
                    child: Divider(
                        thickness: 3, color: (isdummyneeded || currentindex! > 0)
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.3)),
                  ),
                  _buildStepperIcon(1, context,isdummyneeded),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color:isdummyneeded
                          ? currentindex! >= 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withOpacity(0.3)
                          : currentindex! > 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withOpacity(0.3)
                    ),
                  ),
                  _buildStepperIcon(2, context,isdummyneeded),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      firsttext,
                      style: _getStepperTextStyle(isdummyneeded,0, context),
                    ),
                    Text(
                      secondtext,
                      style: _getStepperTextStyle(isdummyneeded,1, context,),
                    ),
                    Text(
                      thridtext,
                      style: _getStepperTextStyle(isdummyneeded,2, context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildDummyStepper(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff07CD6E),
                const Color(0xFF059F55).withOpacity(0.86),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(15),
            ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 20,
          ),
        ));
  }

  Widget _buildStepperIcon(int stepIndex, BuildContext context,bool isdummy) {

    bool isCompleted = isdummy? currentindex! > stepIndex - 1:currentindex! > stepIndex  ;
    bool isInProgress = isdummy? currentindex! == stepIndex-1:currentindex! == stepIndex;
    bool isnext = isdummy?currentindex! < stepIndex - 1:currentindex! < stepIndex  ;

    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: isCompleted || isInProgress ? Colors.white :Colors.grey.withOpacity(0.3),
          gradient:isInProgress||isnext?null: LinearGradient(
            colors: [
              const Color(0xff07CD6E),
              const Color(0xFF059F55).withOpacity(0.86),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
          border:isInProgress? Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ): null,
      ),
      child: isInProgress
          ? Icon(
        Icons.circle,
        color: Theme.of(context).primaryColor,
        size: 22,
      )

          : isCompleted?const Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 20,
        ),
      ):null,
    );
  }

  TextStyle _getStepperTextStyle(bool isdummy, int stepIndex, BuildContext context) {
    bool isCompleted = isdummy? currentindex! > stepIndex - 1:currentindex! > stepIndex  ;
    bool isInProgress = isdummy? currentindex! == stepIndex-1:currentindex! == stepIndex;
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: isCompleted || isInProgress ? Colors.black : Colors.black45,
    );
  }
}

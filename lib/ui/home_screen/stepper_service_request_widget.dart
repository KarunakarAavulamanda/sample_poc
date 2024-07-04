import 'package:flutter/material.dart';
 
class MainPage extends StatefulWidget {
  const MainPage({super.key});
 
  @override
  State<MainPage> createState() => _MainPageState();
}
 
class _MainPageState extends State<MainPage> {
  int _currentStep = 0;
// Color(0xff053c6d)
  Widget controlsBuilder(context, details) {
    return Container(
      width: 150,
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
          style: ButtonStyle(
            // fixedSize: Size.fromWidth(320),
            backgroundColor: WidgetStateProperty.all(
              Color(0xff053c6d),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          onPressed: details.onStepContinue,
          child: Text(
            _currentStep >= 4 ? 'Finish' : 'Proceed',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Stepper(
          elevation: 0,
          steps: [
            Step(
                title: Text('Case Initiation'),
                content: Text(''),
                isActive: _currentStep >= 0,
                state: _currentStep == 0 ? StepState.editing : _currentStep > 0 ? StepState.complete : StepState.disabled,
                stepStyle: StepStyle(
                  color: _currentStep == 0 ? Colors.orange : _currentStep > 0 ? Colors.green : Colors.grey,
                  connectorColor: Colors.grey,
                )
                ),
            Step(//_currentStep > 1 ? StepState.complete : StepState.disabled,
                title: Text('Customer Acknowledgement'),
                content: Text(''),
                isActive: _currentStep >= 1,
                state: _currentStep == 1 ? StepState.editing : _currentStep > 1 ? StepState.complete : StepState.disabled,
                stepStyle: StepStyle(
                  color: _currentStep == 1 ? Colors.orange : _currentStep > 1 ? Colors.green : Colors.grey,
                  connectorColor: Colors.grey,
                )
               
                ),
            Step(
                title: Text('Upload Documents'),
                content: Text(''),
                isActive: _currentStep >= 2,
                state: _currentStep == 2 ? StepState.editing : _currentStep > 2 ? StepState.complete : StepState.disabled,
                stepStyle: StepStyle(
                  color: _currentStep == 2 ? Colors.orange : _currentStep > 2 ? Colors.green : Colors.grey,
                  connectorColor: Colors.grey,
                )
               
                ),
            Step(
                title: Text('Request Submission'),
                content: Text(''),
                isActive: _currentStep >= 3,
                state: _currentStep == 3 ? StepState.editing : _currentStep > 3 ? StepState.complete : StepState.disabled,
                stepStyle: StepStyle(
                  color: _currentStep == 3 ? Colors.orange : _currentStep > 3 ? Colors.green : Colors.grey,
                  connectorColor: Colors.grey,
                )
               
                ),
            Step(
                title: Text('Triggers'),
                content: Text(''),
                isActive: _currentStep >= 4,
                state: _currentStep == 4 ? StepState.editing : _currentStep > 4 ? StepState.complete : StepState.disabled,
                stepStyle: StepStyle(
                  color: _currentStep == 4 ? Colors.orange : _currentStep > 4 ? Colors.green : Colors.grey,
                  connectorColor: Colors.grey,
                )
                // stepStyle: StepStyle(
                //   color: Colors.orange,
                //   connectorColor: Colors.grey,
                // )
                ),
          ],
          onStepTapped: (int newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep != 5) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          type: StepperType.horizontal,
          controlsBuilder: controlsBuilder,
        ),
      ),
    );
  }
}
 
//to have the icons of steps, we need to go to the implementation of Stepper widget and modify the following code:
//line 467 of stepper.dart
// switch (state) {
//       case StepState.indexed:
//       case StepState.disabled:
//         return Icon(
//           Icons.circle_rounded,
//           color: Colors.white,
//           size: 18.0,
//         );
//       case StepState.editing:
//         return Icon(
//           Icons.circle_outlined,
//           color: Colors.white,
//           size: 18.0,
//         );
//       case StepState.complete:
//         return Icon(
//           Icons.check,
//           color: Colors.white,
//           size: 18.0,
//         );
//       case StepState.error:
//         return const Center(child: Text('!', style: _kStepStyle));
//     }
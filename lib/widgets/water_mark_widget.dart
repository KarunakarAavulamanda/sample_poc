import 'package:flutter/material.dart';

class MyWaterMark extends StatelessWidget {
  final String text;
  const MyWaterMark({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.785398, // 45 degrees in radians
      child: Opacity(
        opacity: 0.2,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

Widget Watermark({
  required Widget child,
  required String watermarkText,
  bool multipleWatermarks = false,
  int numberOfWatermarks = 1,
  double height = 100.00,
  double width = 100.00,
  horizontalMultipleWatermarks = false,
}) {
  // Calculate the dynamic height based on the number of watermarks

  return Stack(
    children: [
      child,
      if (!multipleWatermarks) MyWaterMark(text: watermarkText),
      if (multipleWatermarks)
        SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < numberOfWatermarks; i++)
                Row(
                  mainAxisAlignment: horizontalMultipleWatermarks
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: [
                    MyWaterMark(text: watermarkText),
                    if (horizontalMultipleWatermarks)
                      MyWaterMark(text: watermarkText),
                  ],
                ),
            ],
          ),
        ),
    ],
  );
}

getNoOfWatermarks(height) {
  int noOfWatermarks = 0;
  if (height <= 200) {
    noOfWatermarks = 1;
  } else if (height <= 400)
    noOfWatermarks = 2;
  else if (height <= 600)
    noOfWatermarks = 3;
  else if (height <= 800)
    noOfWatermarks = 4;
  else if (height <= 1000)
    noOfWatermarks = 5;
  else
    noOfWatermarks = 6;
  return noOfWatermarks;
}

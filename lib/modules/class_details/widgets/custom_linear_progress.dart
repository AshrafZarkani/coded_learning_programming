import 'package:flutter/material.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:sizer/sizer.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  /// builds a linear progress indicator based on how many questions
  /// answered from the user, for now it is a fixed static value
  const CustomLinearProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.7.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: LinearProgressIndicator(
          value: 4 / 5,
          color: MyAppColors.blue,
          backgroundColor: MyAppColors.lightGrey,
        ),
      ),
    );
  }
}

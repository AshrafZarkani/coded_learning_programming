import 'package:flutter/material.dart';
import 'package:learn_programming/modules/journy/widgets/custome_appbar.dart';
import 'package:learn_programming/modules/journy/widgets/journy_class_card_widget.dart';
import 'package:sizer/sizer.dart';

class JournyScreen extends StatelessWidget {
  /// Creates a JournyScreen
  const JournyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppBar(),
      body: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return LearningClassLevel(index: index);
          },
          itemCount: 3,
        ),
      ),
    );
  }
}

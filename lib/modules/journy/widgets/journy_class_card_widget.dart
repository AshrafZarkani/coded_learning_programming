import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';
import 'package:sizer/sizer.dart';

class LearningClassLevel extends StatelessWidget {
  /// Creates a Class Card view
  const LearningClassLevel({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          context.push(NamedRoutes.classDetails);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.translate.learnHtmlBasics),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(context.translate.createWebPagesHtml),
                      ]),
                ),
                // check to show progress bar or lock icon (Dummy Check)
                // this is usally done on a flag from back end
                index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 3.h,
                          width: 3.h,
                          child: CircularProgressIndicator(
                            value: 2 / 5,
                            color: MyAppColors.blue,
                            backgroundColor: MyAppColors.lightGrey,
                            strokeWidth: 5,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.lock,
                        color: MyAppColors.lightGrey,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

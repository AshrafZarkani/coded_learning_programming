import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:learn_programming/modules/class_details/data/models/questions_model.dart';
import 'package:learn_programming/modules/class_details/providers/class_details_provider.dart';
import 'package:sizer/sizer.dart';

class InteractionOptionsContainer extends ConsumerWidget {
  /// Creates [InteractionOptions] button
  const InteractionOptionsContainer({
    super.key,
    required this.data,
    required this.index,
  });
  final QuestionsData data;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classDetailsController = ref.watch(classDetailsControllerProvider);

    return GestureDetector(
      onTap: () {
        classDetailsController.selectAnswerOption(
            data.interactionModule.interactionOptions[index].text.text);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        margin: EdgeInsets.symmetric(horizontal: 0.5.h),
        decoration: BoxDecoration(
          color: MyAppColors.buttonBackground,
          borderRadius: BorderRadius.circular(6),
        ),

        /// hides the text if selected
        child: Text(classDetailsController.replacement.contains(
                data.interactionModule.interactionOptions[index].text.text)
            ? "         "
            : data.interactionModule.interactionOptions[index].text.text),
      ),
    );
  }
}

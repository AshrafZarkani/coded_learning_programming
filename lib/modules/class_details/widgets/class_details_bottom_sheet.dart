import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_programming/core/constants/my_app_colors.dart';
import 'package:learn_programming/modules/class_details/data/models/questions_model.dart';
import 'package:learn_programming/modules/class_details/providers/class_details_provider.dart';
import 'package:learn_programming/modules/class_details/widgets/interaction_options_container.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class ClassDetailsBottomSheet extends ConsumerWidget {
  const ClassDetailsBottomSheet({
    super.key,
    required this.data,
  });
  final QuestionsData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classDetailsController = ref.watch(classDetailsControllerProvider);
    return Container(
      height: 21.h,
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.5.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        classDetailsController.removeUserAnsweredOption();
                      },
                      icon: Icon(
                        Icons.backspace_outlined,
                        color: classDetailsController.replacement.isEmpty
                            ? MyAppColors.grey.withOpacity(0.2)
                            : MyAppColors.grey,
                      )),
                  IconButton(
                    onPressed: () {
                      classDetailsController.removeAllUserAnswers();
                    },
                    icon: const Icon(Icons.refresh_outlined),
                    color: classDetailsController.replacement.isEmpty
                        ? MyAppColors.grey.withOpacity(0.2)
                        : MyAppColors.grey,
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: () {
                  bool result =
                      classDetailsController.checkAnsweredStringValidity();
                  if (result == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(data.postInteraction[0].text)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(data.postInteraction[1].text)));
                  }
                },
                backgroundColor: classDetailsController.replacement.isEmpty
                    ? MyAppColors.grey.withOpacity(0.2)
                    : MyAppColors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90)),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: MyAppColors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InteractionOptionsContainer(data: data, index: index);
              },
              itemCount: data.interactionModule.interactionOptions.length,
            ),
          )
        ],
      ),
    );
  }
}

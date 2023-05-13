import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_programming/core/constants/my_app_colors.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';
import 'package:learn_programming/modules/class_details/data/models/questions_model.dart';
import 'package:learn_programming/modules/class_details/providers/class_details_provider.dart';
import 'package:learn_programming/modules/class_details/widgets/class_details_bottom_sheet.dart';
import 'package:learn_programming/modules/class_details/widgets/custom_linear_progress.dart';
import 'package:learn_programming/modules/class_details/widgets/custome_app_bar.dart';
import 'package:sizer/sizer.dart';

class ClassDetails extends ConsumerWidget {
  const ClassDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadJsonData = ref.watch(loadJsonDataFutureProvider);

    return loadJsonData.when(
        data: (data) {
          return DetailsClassBody(data);
        },
        error: (Object error, StackTrace stackTrace) {
          return Scaffold(
            appBar: const ClassDetailsAppBar(),
            body: Container(),
          );
        },
        loading: () => const Scaffold(
              appBar: ClassDetailsAppBar(),
              body: Center(
                child: CircularProgressIndicator(
                  color: MyAppColors.blue,
                ),
              ),
            ));
  }
}

class DetailsClassBody extends StatelessWidget {
  const DetailsClassBody(this.data, {super.key});

  final QuestionsData data;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final classDetailsController = ref.watch(classDetailsControllerProvider);
      String questionWithInteractionText =
          classDetailsController.newQuestionString;
      classDetailsController
          .setOfAnswerOptions(data.interactionModule.interactionOptions);
      String questionWithoutInteractionText = classDetailsController
          .newQuestionWithoutInteractionText(data.preInteraction[1].text);
      return Scaffold(
        appBar: const ClassDetailsAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.h),
              child: const CustomLinearProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.h),
              child: FittedBox(
                child: Text(
                  data.preInteraction[1].text,
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              color: MyAppColors.defaultGrey.withOpacity(0.1),
              padding: EdgeInsets.symmetric(vertical: 2.h),
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Text(
                      data.files.first.name,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Wrap(
                        children: [
                          /// looping over each string value and check if matches "_" show container
                          if (classDetailsController.replacement.isEmpty)
                            ...questionWithoutInteractionText
                                .replaceAllMapped(
                                    classDetailsController.uuid, (m) => "_")
                                .split("")
                                .map((e) {
                              if (e.toString() != "_") {
                                return Text(e.toString());
                              } else {
                                return Container(
                                  color: MyAppColors.lightGrey.withOpacity(0.1),
                                  height: 3.h,
                                  width: 3.h,
                                );
                              }
                            }),

                          if (classDetailsController.replacement.isNotEmpty)
                            ...questionWithInteractionText
                                .split(classDetailsController.uuid)
                                .map((e) {
                              if (e.toString() != classDetailsController.uuid) {
                                return Text(e.toString());
                              } else {
                                return Container(
                                  color: MyAppColors.lightGrey.withOpacity(0.1),
                                  height: 3.h,
                                  width: 3.h,
                                );
                              }
                            })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: ClassDetailsBottomSheet(data: data),
      );
    });
  }
}

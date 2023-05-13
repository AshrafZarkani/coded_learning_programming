import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_programming/core/constants/my_app_colors.dart';
import 'package:learn_programming/modules/class_details/providers/class_details_provider.dart';
import 'package:sizer/sizer.dart';

class ClassDetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  ///Builds a class details [AppBar]
  const ClassDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 10.h,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.close,
          color: MyAppColors.grey2,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Consumer(builder: (context, ref, child) {
            final classDetailsController =
                ref.watch(classDetailsControllerProvider);

            return IconButton(
                onPressed: () {
                  classDetailsController.toggle();
                },
                icon: Icon(
                  Icons.favorite,
                  color: classDetailsController.isFavorite
                      ? MyAppColors.red
                      : MyAppColors.defaultGrey.withOpacity(0.3),
                ));
          }),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(10.h);
}

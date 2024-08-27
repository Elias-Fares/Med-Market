import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';

import '../../core/widgets/style/color.dart';

class GoToOperation extends StatelessWidget {
  final String opName;
  final void Function()? onTap;
  final bool? isDelete;
  final Widget? destinationOperation;
  final String? destinationOperationRouteName;

  const GoToOperation(
      {super.key,
      required this.opName,
      this.onTap,
      this.isDelete,
      this.destinationOperation,  this.destinationOperationRouteName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            final _navigationController = Get.find<NavigationController>();

            _navigationController.nestPush(context,
                nextPage: destinationOperation!,
                nextPageRoute: destinationOperationRouteName!);
          },
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      opName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp,
                          color: isDelete == true
                              ? AppColors.deleteIconColor
                              : AppColors.textColor),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    weight: 10,
                    color: (isDelete ?? false) == true
                        ? AppColors.deleteIconColor
                        : AppColors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const Divider(
                endIndent: 5,
                indent: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

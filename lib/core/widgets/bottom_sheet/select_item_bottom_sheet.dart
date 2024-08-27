import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utlis/translation/local_keys.dart';
import '../button/custom_ink_well.dart';
import '../list_views/custom_list_view_separator.dart';
import '../style/color.dart';
import '../text/base_text.dart';
import 'ka_bottom_sheet.dart';

class SelectItemBottomSheet<T> extends StatelessWidget {
  final String title;
  final List<String> itemsLabel;
  final List<T> itemValues;
  final T selectedItemValue;
  final Function(T item, String label) selectItem;

  const SelectItemBottomSheet(
      {super.key,
      this.title = LocalKeys.select_item,
      required this.selectItem,
      required this.selectedItemValue,
      required this.itemsLabel,
      required this.itemValues});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 28.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: BaseText(
            title: title.tr,
            fontWeight: FontWeight.w700,
            color: AppColors.thirdMainColor,
            size: 16.sp,
          ),
        ),
        SizedBox(height: 32.h),
        Container(
          constraints: BoxConstraints.loose(Size(1.sw, .71.sh)),
          child: CustomListViewSeparator(
            itemCount: itemsLabel.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            separatorChild: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0.h),
              child: Divider(
                  color: AppColors.iconColorV1.withOpacity(0.2),
                  thickness: 0.5.h),
            ),
            itemBuilder: (BuildContext context, int index) {
              final itemLabel = itemsLabel[index];
              final itemValue = itemValues[index];

              bool isSelected = itemValue == selectedItemValue;

              return ItemBottomSheetCard<T>(
                isSelected: isSelected,
                item: itemLabel,
                onPress: selectItem,
                value: itemValue,
              );
            },
          ),
        )
      ],
    );
  }
}

openSelectItemBottomSheet<T>(
    {String? title,
    required List<String> itemsLabel,
    required List<T> itemValues,
    required T selectedItemValue,
    required Function(T item, String label) selectItem}) {
  showKaBottomSheet(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 22.h),

      child: SelectItemBottomSheet<T>(
        title: title ?? LocalKeys.select_item,
        selectItem: selectItem,
        selectedItemValue: selectedItemValue,
        itemsLabel: itemsLabel,
        itemValues: itemValues,
      ));
}

class ItemBottomSheetCard<T> extends StatelessWidget {
  final bool isSelected;
  final Function(T, String) onPress;
  final String item;
  final T value;

  const ItemBottomSheetCard({
    super.key,
    required this.isSelected,
    required this.onPress,
    required this.item,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        if (!isSelected) onPress(value, item);
      },
      borderRadius: BorderRadius.circular(4.r),
      child: Row(
        children: [
          Container(
            height: 16.r,
            width: 16.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.borderColor,
                  width: 1.r),
            ),
            padding: EdgeInsets.all(3.r),
            child: Container(
                decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected ? AppColors.primaryColor : AppColors.transparent,
            )),
          ),
          const SizedBox(width: 8),
          BaseText(
            title: item.tr,
            size: 13.sp,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}

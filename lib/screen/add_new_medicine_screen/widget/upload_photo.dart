part of '../add_new_medicine.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.greenPrimaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor)),
            child: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.gray,
            )),
      ),
    );
  }
}

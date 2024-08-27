part of '../client_home.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    this.onTap,
    this.readOnly,
  });

  final void Function()? onTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(56),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(0, 8),
                        color: AppColors.grey60.withOpacity(0.15))
                  ]),
              child: CustomTextFormField(
                onTap: onTap,
                readOnly: true,
                prefixIconConstraints: BoxConstraints.tight(const Size(50, 20)),
                prefixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: Icon(
                    Icons.search_outlined,
                    color: AppColors.yellowPrimaryColor,
                  ),
                ),
                hintText: "Search here",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.hintTextColor),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                borderRadius: BorderRadius.circular(56),
                borderStyleType: BorderStyleType.outlineInput,
                borderEnabledColor: AppColors.transparent,
                filled: true,
                fillColor: AppColors.whiteBackground1,
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
            IconButton(
                onPressed: () {
                  final NavigationController navigationController = Get.find();
                  navigationController.nestPush(context,
                      nextPage: const NotificationsScreen(),
                      nextPageRoute: NotificationsScreen.routeName);
                },
                icon: const Icon(
                  Icons.notifications,
                  size: 28,
                  color: AppColors.yellowPrimaryColor,
                ))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(320, 70);
}

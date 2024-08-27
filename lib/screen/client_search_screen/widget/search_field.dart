part of '../client_search.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller, this.searchButton,
  });
  final TextEditingController controller;
  final void Function()? searchButton;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        onTap: () {},
        suffixIconConstraints: BoxConstraints.tight(const Size(50, 20)),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: InkWell(
            child: const Icon(
              Icons.search_outlined,
              color: AppColors.yellowPrimaryColor,
            ),
            onTap: searchButton,
          ),
        ),
        hintText: "Search here about medicine",
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.hintTextColor),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        borderRadius: BorderRadius.circular(56),
        borderStyleType: BorderStyleType.outlineInput,
        borderEnabledColor: AppColors.transparent,
        controller: controller,
        filled: true,
        fillColor: AppColors.whiteBackground1,
      ),
    );
  }
}

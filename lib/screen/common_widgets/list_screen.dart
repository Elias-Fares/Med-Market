import 'package:flutter/material.dart';
import 'package:pharmachy_app/core/widgets/style/custom_shimmer.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import '../../core/widgets/progressIndicator/custom_progress_indicator.dart';

class ListScreen extends StatefulWidget {
  //--------Appbar Section--------------------------------------------

  final PreferredSizeWidget? mainAppbar;

  final String? appbarTitle;
  final double? appbarTextSize;
  final FontWeight? appbarFontWeight;
  final VoidCallback? appbarArrowBackFunc;
  final GestureTapCallback? appbarTitleOnTap;

  //--------Body Section ---------------------------------------------

  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final bool shrinkWrap;
  final int? itemCount;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final IndexedWidgetBuilder itemBuilder;
  final bool isLoading;
  final int itemCountShimmer;
  final IndexedWidgetBuilder itemBuilderShimmer;
  final Widget? headerWidget;
  final Widget? footerWidget;
  final Widget? appEndDrawer;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final Color? backgroundColor;
  final Widget? floatingActionButton;

  //----------------Loading Section --------------------------------

  final bool isLoadingPagination;

  const ListScreen({
    super.key,
    this.mainAppbar,
    this.appbarTitle,
    this.appbarTextSize,
    this.appbarArrowBackFunc,
    this.appbarFontWeight,
    this.appbarTitleOnTap,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 20,
    this.crossAxisSpacing = 16,
    this.shrinkWrap = true,
    required this.itemCount,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
    this.isLoadingPagination = false,
    this.isLoading = false,
    this.itemCountShimmer = 3,
    required this.itemBuilderShimmer,
    this.headerWidget,
    required this.columnCrossAxisAlignment,
    this.footerWidget,
    this.backgroundColor,
    this.appEndDrawer,
    this.floatingActionButton,
  });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // final ScrollController allStoriesScrollController = ScrollController();

  Widget shimmerWidget() {
    return CustomShimmer(
      child: ListView.builder(
          shrinkWrap: widget.shrinkWrap,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.itemCountShimmer,
          scrollDirection: widget.scrollDirection,
          itemBuilder: widget.itemBuilderShimmer),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      key: widget.key,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //-----------Appbar Section------------------------------------------------
      appBar: widget.mainAppbar ??
          SubAppBar(
            title: widget.appbarTitle ?? "",
            arrowBackFunc: widget.appbarArrowBackFunc,
            fontWeight: widget.appbarFontWeight,
            onTap: widget.appbarTitleOnTap,
            textSize: widget.appbarTextSize,
          ),
      //----------------End drawer Section -------------------------------------

      //-----------Body Section------------------------------------------------
      body: SingleChildScrollView(
        controller: widget.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: widget.columnCrossAxisAlignment,
          children: [
            if (widget.headerWidget != null) ...[
              const SizedBox(
                height: 25,
              ),
              widget.headerWidget!,
              const SizedBox(
                height: 25,
              ),
            ],
            widget.isLoading
                ? shimmerWidget()
                : ListView.builder(
                    shrinkWrap: widget.shrinkWrap,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.itemCount,
                    scrollDirection: widget.scrollDirection,
                    itemBuilder: widget.itemBuilder),
            if (widget.footerWidget != null) ...[
              const SizedBox(
                height: 25,
              ),
              widget.footerWidget!,
              const SizedBox(
                height: 25,
              ),
            ],
            if (widget.isLoadingPagination) ...[
              const SizedBox(
                height: 10,
              ),
              CustomProgressIndicator(isLoading: widget.isLoadingPagination),
              const SizedBox(
                height: 10,
              )
            ]
          ],
        ),
      ),
    );

    //-----------End Body Section------------------------------------------------
  }
}

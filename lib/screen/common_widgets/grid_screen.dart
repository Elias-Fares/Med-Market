import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import '../../core/widgets/progressIndicator/custom_progress_indicator.dart';
import '../../core/widgets/style/custom_shimmer.dart';

class GridScreen extends StatefulWidget {
  //--------Appbar Section--------------------------------------------

  final PreferredSizeWidget? mainAppbar;

  final String? appbarTitle;
  final double? appbarTextSize;
  final FontWeight? appbarFontWeight;
  final VoidCallback? appbarArrowBackFunc;
  final GestureTapCallback? appbarTitleOnTap;

  //--------Body Section ---------------------------------------------

  final int crossAxisCount;

  final Widget? headerWidget;

  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final bool shrinkWrap;
  final int? itemCount;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final IndexedWidgetBuilder itemBuilder;

  //----------------Loading Section --------------------------------

  final bool isLoadingPagination;
  final bool isLoading;
  final IndexedWidgetBuilder itemBuilderShimmer;
  final int itemCountShimmer;

  const GridScreen(
      {super.key,
      this.mainAppbar,
      this.headerWidget,
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
      required this.itemBuilderShimmer});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  // final ScrollController allStoriesScrollController = ScrollController();

  Widget shimmerWidget() {
    return CustomShimmer(
      child: MasonryGridView.count(
          crossAxisCount: widget.crossAxisCount,
          mainAxisSpacing: widget.mainAxisSpacing,
          crossAxisSpacing: widget.crossAxisSpacing,
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
      //-----------Appbar Section------------------------------------------------
      appBar: widget.mainAppbar ??
          SubAppBar(
            title: widget.appbarTitle ?? "",
            arrowBackFunc: widget.appbarArrowBackFunc,
            fontWeight: widget.appbarFontWeight,
            onTap: widget.appbarTitleOnTap,
            textSize: widget.appbarTextSize,
          ),
      //----------------End Appbar Section -------------------------------------

      //-----------Body Section------------------------------------------------
      body: SingleChildScrollView(
        controller: widget.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.headerWidget != null) ...[
              const SizedBox(
                height: 24,
              ),
              widget.headerWidget!,
              const SizedBox(
                height: 24,
              ),
            ],
            widget.isLoading
                ? shimmerWidget()
                : MasonryGridView.count(
                    crossAxisCount: widget.crossAxisCount,
                    mainAxisSpacing: widget.mainAxisSpacing,
                    crossAxisSpacing: widget.crossAxisSpacing,
                    shrinkWrap: widget.shrinkWrap,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.itemCount,
                    scrollDirection: widget.scrollDirection,
                    
                    itemBuilder: widget.itemBuilder),
            if (widget.isLoadingPagination) ...[
              const SizedBox(
                height: 20,
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

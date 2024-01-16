part of '../../countries.exports.dart';

class CountriesPageIndicatorsWidget extends StatelessWidget {
  const CountriesPageIndicatorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
      buildWhen: (prev, curr) => prev.currentPage != curr.currentPage,
      builder: (_, state) => LayoutBuilder(
        builder: (_, constraints) {
          const btnWidth = 36.0;
          const gap = 5.0;
          const numOfArrowBtns = 4;
          const totalArrowBtnGaps = gap * numOfArrowBtns;
          const totalArrowBtnWidths = btnWidth * numOfArrowBtns;
          final restWidthFromArrowBtns =
              constraints.maxWidth - (totalArrowBtnGaps + totalArrowBtnWidths);

          // Get the number of btns which I can draw on the screen
          final numOfPageBtns = restWidthFromArrowBtns ~/ btnWidth;
          // Get the total gaps among the page btns
          // final totalPageBtnGaps = numOfPageBtns * gap;
          // final restWidth = restWidthFromArrowBtns - totalPageBtnGaps;

          final currentPage = state.currentPage;
          final totalPages = state.totalPages;

          final pager = paginationAlgorithm(
            numOfPageBtns,
            page: currentPage,
            total: totalPages,
          );

          final widgets = pager.map(
            (res) {
              if (res.runtimeType == int) {
                return _PageBtn(
                  onPressed: () => context
                      .read<CountriesBloc>()
                      .add(CountriesOnGo(index: res)),
                  page: res,
                  isActive: currentPage == res,
                );
              } else {
                return const _Ellipses();
              }
            },
          ).toList();

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ArrowBtn(
                onPressed: () =>
                    context.read<CountriesBloc>().add(CountriesOnFirst()),
                icon: Icons.keyboard_double_arrow_left,
              ),
              const Gap(gap),
              _ArrowBtn(
                onPressed: () =>
                    context.read<CountriesBloc>().add(CountriesOnPrev()),
                icon: Icons.chevron_left,
              ),
              const Gap(gap),
              for (int index = 0; index < widgets.length; index++) ...[
                widgets[index],
                if (index != widgets.length - 1) const Gap(gap),
              ],
              const Gap(gap),
              _ArrowBtn(
                onPressed: () =>
                    context.read<CountriesBloc>().add(CountriesOnNext()),
                icon: Icons.chevron_right,
              ),
              const Gap(gap),
              _ArrowBtn(
                onPressed: () =>
                    context.read<CountriesBloc>().add(CountriesOnLast()),
                icon: Icons.keyboard_double_arrow_right,
              ),
            ],
          );
        },
      ),
    );
  }

  List<dynamic> paginationAlgorithm(
    int count, {
    String ellipsis = '…',
    int page = 1,
    int total = 1,
  }) {
    /*
    *suppose: count = 6, page = 1, total = 10 => [1, 2, 3, 4, 5, ..., 10]
    start = 1 - ((6 - 3) ~/ 2) = 1 - (3 ~/ 2) = 1 -1 = 0
    end = 1 + ((6 - 2) ~/ 2) = 1 + (3 ~/ 2) = 1 + 1 = 2
    startPage = 0.clamp(1, 10 - 6 + 2) = 0.clamp(1, 8) = 1
    endPage = 2.clamp(6 - 1, 10) = 2.clamp(5, 10) = 5

    *suppose: count = 6, page = 10, total = 10 => [1, ..., 6, 7, 8, 9, 10]
    start = 10 - ((6 - 3) ~/ 2) = 10 - (3 ~/ 2) = 10 - 1 = 9
    end = 10 + ((6 - 2) ~/ 2) = 10 + (3 ~/ 2) = 10 + 1 = 11
    startPage = 9.clamp(1, 10 - 6 + 2) = 9.clamp(1, 8) = 8
    endPage = 11.clamp(6 - 1, 10) = 11.clamp(5, 10) = 10

    *suppose: count = 6, page = 5, total = 10 => [1, ..., 6, 7, 8, ..., 10]
    start = 5 - ((6 - 3) ~/ 2) = 5 - (3 ~/ 2) = 5 - 1 = 4
    end = 5 + ((6 - 2) ~/ 2) = 5 + (3 ~/ 2) = 5 + 1 = 6
    startPage = 4.clamp(1, 10 - 6 + 2) = 4.clamp(1, 8) = 4
    endPage = 6.clamp(6 - 1, 10) = 6.clamp(5, 10) = 6
    */
    final int start = page - ((count - 3) ~/ 2).floor();
    final int end = page + ((count - 2) ~/ 2).floor();

    int startPage = start.clamp(1, total - count + 2);
    int endPage = end.clamp(count - 1, total);

    final firstPages = [
      ...(startPage > 2
          ? [1, ellipsis]
          : startPage > 1
              ? [1]
              : []),
    ];
    final lastPages = [
      ...(endPage < total - 1
          ? [ellipsis, total]
          : endPage < total
              ? [total]
              : []),
    ];

    int centerCounts = endPage - startPage + 1;
    while (centerCounts + firstPages.length + lastPages.length > count + 1) {
      centerCounts--;
    }

    List<dynamic> result = [
      ...firstPages,
      ...List<int>.generate(
        centerCounts,
        (index) => startPage + index,
      ),
      ...lastPages,
    ];

    return result;
  }
}

//!
class _Ellipses extends StatelessWidget {
  const _Ellipses();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.0,
      alignment: Alignment.bottomCenter,
      // color: AppColor.error300,
      child: AutoSizeText(
        "...",
        style: AppStyle.mediumFont.copyWith(
          fontSize: 14.0,
          color: AppColor.grey800,
        ),
      ),
    );
  }
}

//!
class _ArrowBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _ArrowBtn({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColor.grey300,
      style: IconButton.styleFrom(
        minimumSize: const Size.square(36.0),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
          side: const BorderSide(color: AppColor.grey200, width: 1.5),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 16.0),
    );
  }
}

//!
class _PageBtn extends StatelessWidget {
  final int page;
  final bool isActive;
  final VoidCallback onPressed;
  const _PageBtn({
    required this.page,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColor.grey300,
      style: IconButton.styleFrom(
        minimumSize: const Size.square(36.0),
        backgroundColor: isActive ? AppColor.primary900 : Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
          side: isActive
              ? BorderSide.none
              : const BorderSide(color: AppColor.grey200, width: 1.5),
        ),
      ),
      onPressed: onPressed,
      icon: AutoSizeText(
        "$page",
        style: AppStyle.mediumFont.copyWith(
          color: isActive ? AppColor.white : AppColor.grey800,
          fontSize: 14.0,
        ),
        maxFontSize: 14.0,
        minFontSize: 8.0,
      ),
    );
  }
}

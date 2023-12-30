part of '../../shared_feature.exports.dart';

class SliderWidget extends StatefulWidget {
  final PageController? pageController;
  final Duration transitionDuration;
  final Duration animationDuration;
  final int initialPage;
  final bool autoScroll;
  final List<Widget> pages;
  final void Function(int index)? onPageChanged;
  const SliderWidget({
    super.key,
    this.pageController,
    this.transitionDuration = const Duration(milliseconds: 3000),
    this.animationDuration = const Duration(milliseconds: 700),
    this.initialPage = 0,
    this.autoScroll = true,
    required this.pages,
    this.onPageChanged,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late PageController _pageController;
  Timer? _timer;
  late SliderCubit _sliderCubit;

  @override
  void initState() {
    super.initState();
    _sliderCubit = SliderCubit(initialPage: widget.initialPage);

    _pageController = widget.pageController ??
        PageController(initialPage: widget.initialPage, viewportFraction: 0.90);

    if (widget.autoScroll) {
      _timer = Timer.periodic(widget.transitionDuration, (_) => onSliding());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    _sliderCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          // 24.0: 12.0 gap + 10.0 dotHeight + 2.0 extra space
          height: 156.0 + 24.0,
          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: widget.pages.length,
            itemBuilder: (_, index) => BlocBuilder<SliderCubit, int>(
              bloc: _sliderCubit,
              builder: (_, activeIndex) => AnimatedScale(
                duration: widget.animationDuration,
                scale: index == activeIndex ? 1.0 : 0.90,
                child: AnimatedOpacity(
                  duration: widget.animationDuration,
                  opacity: index == activeIndex ? 1.0 : 0.5,
                  child: widget.pages[index],
                ),
              ),
            ),
            onPageChanged: (index) {
              if (widget.onPageChanged != null) widget.onPageChanged!(index);
              _sliderCubit.onUpdatePage(index);
            },
          ),
        ),
        const Gap(12.0),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.pages.length,
          effect: WormEffect(
            dotHeight: 10.0,
            dotWidth: 10.0,
            spacing: 10.0,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotColor: AppColor.inactiveIndicator,
          ),
          onDotClicked: onDotClicked,
        ),
      ],
    );
  }

  void onDotClicked(int index) => _pageController.animateToPage(
        index,
        duration: AppConfig.animationDuration,
        curve: Curves.easeIn,
      );

  void onSliding() {
    final double currentPage = _pageController.page ?? 0.0;
    final int lastPage = widget.pages.length - 1;
    final double tolerance = _pageController.viewportFraction / lastPage;
    if ((currentPage + tolerance).round() >= lastPage) {
      // If we're on the last page, jump back to the first page
      _pageController.animateToPage(
        0,
        duration: widget.animationDuration,
        curve: Curves.easeOut,
      );
    } else {
      // Otherwise, go to the next page
      _pageController.nextPage(
        duration: widget.animationDuration,
        curve: Curves.easeIn,
      );
    }
  }
}

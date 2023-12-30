part of '../../fixed_income.exports.dart';

class FixedIncomePage extends StatefulWidget {
  const FixedIncomePage({super.key});

  @override
  State<FixedIncomePage> createState() => _FixedIncomePageState();
}

class _FixedIncomePageState extends State<FixedIncomePage> {
  late GlobalKey<NavigatorState> _navigatorKey;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _navigatorKey = GlobalKey<NavigatorState>();
    _controller = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<ScrollToCubit>().onBackToInitial();
        if (_controller.hasClients) _controller.addListener(onListener);
        onScrollToPosition(120.0);
      },
    );
  }

  @override
  void dispose() {
    _controller
      ..removeListener(onListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvestmentAmountCubit>(
      create: (_) => InvestmentAmountCubit()..onFetch(),
      child: Scaffold(
        key: _navigatorKey,
        appBar: const FixedIncomeHeaderWidget(),
        body: FixedIncomeBodyWidget(controller: _controller),
        floatingActionButton: FixedIncomeFabButtons(
          onScrollToBottom: onScrollToBottom,
          onScrollToTop: onScrollToTop,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      ),
    );
  }

  void onListener() =>
      context.read<ScrollToCubit>().onCalculateOffset(_controller.offset);

  // to feel with bouncing scroll
  void onScrollToTop() => onScrollToPosition(-30.0);

  void onScrollToBottom() =>
      onScrollToPosition(_controller.position.maxScrollExtent);

  void onScrollToPosition(double offset) {
    _controller.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

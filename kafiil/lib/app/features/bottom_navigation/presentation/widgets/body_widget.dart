part of '../../bottom_navigation.exports.dart';

class BottomNavBarBodyWidget extends StatelessWidget {
  const BottomNavBarBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBar>(
      buildWhen: (prev, curr) => prev != curr,
      //? By animations package
      builder: (_, navBarState) => PageTransitionSwitcher(
        duration: AppConfig.animationDuration,
        transitionBuilder: (widget, anim1, anim2) {
          //? By animations package
          return FadeThroughTransition(
            animation: anim1,
            secondaryAnimation: anim2,
            child: widget,
          );
        },
        child: SizedBox(
          key: ValueKey<int>(navBarState.index),
          child: switch (navBarState.index) {
            (int index) => BottomNavBar.values[index].page,
          },
        ),
      ),
    );
  }
}

part of '../../bottom_navigation.exports.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBar>(
      buildWhen: (prev, curr) => prev != curr,
      builder: (_, navBarState) => BottomNavBarStructure(
        children: BottomNavBar.values
            .map((navBar) => BottomNavBarCard(
                  icon: navBar.icon,
                  label: navBar.label,
                  isSelected: navBarState.index == navBar.index,
                  onSelected: () => context
                      .read<BottomNavBarCubit>()
                      .onChangeBottomNavBar(navBar.index),
                ))
            .toList(),
      ),
    );
  }
}

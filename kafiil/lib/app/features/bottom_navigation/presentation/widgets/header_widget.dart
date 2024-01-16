part of '../../bottom_navigation.exports.dart';

class BottomNavBarHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const BottomNavBarHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<BottomNavBarCubit, BottomNavBar>(
        buildWhen: (prev, curr) => prev != curr,
        builder: (_, navBarState) => FadeIn(
          delay: AppConfig.animationDuration,
          key: ValueKey(navBarState.label),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(navBarState.label),
              if (navBarState == BottomNavBar.whoAmI) const _Logout(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Logout extends StatelessWidget {
  const _Logout();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColor.error300,
      iconSize: 22.0,
      splashColor: Colors.amber,
      style: IconButton.styleFrom(minimumSize: const Size.square(42.0)),
      onPressed: () async {
        await context.read<EntryPointCubit>().clearToken();
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(RouteName.login);
        }
      },
      icon: const Icon(Icons.logout),
    );
  }
}

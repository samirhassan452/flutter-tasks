part of '../../bottom_navigation.exports.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarCubit>(
          create: (_) => BottomNavBarCubit(initialNavBar: BottomNavBar.home),
        ),
        BlocProvider<ScrollToCubit>(create: (_) => ScrollToCubit()),
        BlocProvider<PackagesCubit>(
          create: (_) => PackagesCubit()..onFetchPackages(),
        ),
        BlocProvider<BondsCubit>(create: (_) => BondsCubit()..onFetchBonds()),
      ],
      child: const Scaffold(
        body: BottomNavBarBodyWidget(),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}

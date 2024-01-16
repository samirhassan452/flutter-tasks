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
          create: (_) => BottomNavBarCubit(initialNavBar: BottomNavBar.whoAmI),
        ),
        BlocProvider<WhoAmICubit>(
          create: (_) =>
              WhoAmICubit(entryPointCubit: context.read<EntryPointCubit>())
                ..onFetch(),
        ),
        BlocProvider<CountriesBloc>(
          create: (_) => CountriesBloc()..add(CountriesOnFetch()),
        ),
        BlocProvider<ServicesCubit>(
          create: (_) => ServicesCubit()..onFetch(),
        ),
      ],
      child: const Scaffold(
        appBar: BottomNavBarHeaderWidget(),
        body: BottomNavBarBodyWidget(),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}

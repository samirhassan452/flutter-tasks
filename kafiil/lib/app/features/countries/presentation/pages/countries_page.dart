part of '../../countries.exports.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CountriesBodyWidget(),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        buildWhen: (_, curr) => curr.rebuildPage,
        builder: (_, state) => switch (state.status) {
          BlocStatus.getLoading => const CountriesShimmerPage(),
          BlocStatus.getFailure => FailureComponent(
              message: state.errorMsg,
              onRetry: () =>
                  context.read<CountriesBloc>().add(CountriesOnFetch()),
            ),
          _ => state.countries.isEmpty
              ? const SizedBox()
              : const CountriesBodyWidget(),
        },
      ),
    );
  }
}

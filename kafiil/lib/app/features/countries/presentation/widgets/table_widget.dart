part of '../../countries.exports.dart';

class CountriesTableWidget extends StatelessWidget {
  const CountriesTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.white,
      elevation: 2.0,
      // shadowColor: AppColor.primary900,
      borderRadius: tableRadius,
      child: Column(
        children: [
          const Gap(14.0),
          // Columns
          const CountriesTableColsWidget(
            tableColumns: ["Country", "Capital"],
          ),
          const Gap(14.0),
          // Rows
          BlocBuilder<CountriesBloc, CountriesState>(
            buildWhen: (prev, curr) =>
                curr.rebuildTable || prev.currentPage != curr.currentPage,
            builder: (_, state) {
              final currentPage = state.currentPage;
              final previousPage = state.previousPage;
              if (currentPage >= previousPage) {
                return FadeInRight(
                  key: ValueKey("$currentPage"),
                  child: switch (state.status) {
                    BlocStatus.loadMoreLoading => CountriesShimmerTableWidget(
                        numOfRows: state.pagination?.perPage ?? 10,
                      ),
                    BlocStatus.loadMoreFailure => FailureComponent(
                        message: state.errorMsg,
                        onRetry: () => context
                            .read<CountriesBloc>()
                            .add(CountriesOnFetchMore()),
                      ),
                    _ => _RowsWidget(countries: state.countries[currentPage]!),
                  },
                );
              } else {
                return FadeInLeft(
                  key: ValueKey("$currentPage"),
                  child: switch (state.status) {
                    BlocStatus.loadMoreLoading => CountriesShimmerTableWidget(
                        numOfRows: state.pagination?.perPage ?? 10,
                      ),
                    BlocStatus.loadMoreFailure => FailureComponent(
                        message: state.errorMsg,
                        onRetry: () => context
                            .read<CountriesBloc>()
                            .add(CountriesOnFetchMore()),
                      ),
                    _ => _RowsWidget(countries: state.countries[currentPage]!),
                  },
                );
              }
            },
          ),
          const Gap(18.0),
        ],
      ),
    );
  }

  BorderRadius get tableRadius => BorderRadius.circular(8.0);
}

//!
class _RowsWidget extends StatelessWidget {
  final List<CountryModel> countries;
  const _RowsWidget({required this.countries});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < countries.length; index++) ...[
          CountriesTableRowWidget(
            isFirstRow: index == 0,
            isLastRow: index == countries.length - 1,
            rowValues: [countries[index].name, countries[index].capital],
          )
        ],
      ],
    );
  }
}

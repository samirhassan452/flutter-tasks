part of '../../who_am_i.exports.dart';

class WhoAmIPage extends StatelessWidget {
  const WhoAmIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WhoAmICubit, WhoAmIState>(
        builder: (_, state) => switch (state.status) {
          BlocStatus.loading => const WhoAmIShimmerPage(),
          BlocStatus.failure => FailureComponent(
              message: state.errorMsg,
              onRetry: context.read<WhoAmICubit>().onFetch,
            ),
          _ => const WhoAmIBodyWidget(),
        },
      ),
    );
  }
}

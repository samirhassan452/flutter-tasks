part of '../../services.exports.dart';

class ServicesBodyWidget extends StatelessWidget {
  const ServicesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        children: [
          // const Gap(32.0),
          BlocBuilder<ServicesCubit, ServicesState>(
            buildWhen: (_, curr) => curr.rebuildServicesSection,
            builder: (_, state) => switch (state.status) {
              BlocStatus.loading => const DefaultServicesShimmerWidget(),
              BlocStatus.failure => const _ErrorComponent(),
              _ => DefaultServicesWidget(services: state.services),
            },
          ),
          //
          const Gap(40.0),
          BlocBuilder<ServicesCubit, ServicesState>(
            buildWhen: (_, curr) => curr.rebuildPopularServicesSection,
            builder: (_, state) => switch (state.popularServicesStatus) {
              BlocStatus.loading => const DefaultServicesShimmerWidget(),
              BlocStatus.failure => const _ErrorComponent(),
              _ =>
                PopularServicesWidget(popularServices: state.popularServices),
            },
          ),
        ],
      ),
    );
  }
}

//!
class _ErrorComponent extends StatelessWidget {
  const _ErrorComponent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (_, state) {
        final msg = switch (state.showSharedErrorComponent) {
          (_) when state.showServicesErrorComponent => state.errorMsg,
          (_) when state.showPopularServicesErrorComponent =>
            state.popularServicesErrorMsg,
          _ => state.errorMsg, // take anyone of them
        };
        final onRetry = switch (state.showSharedErrorComponent) {
          (_) when state.showServicesErrorComponent =>
            context.read<ServicesCubit>().onFetchServices,
          (_) when state.showPopularServicesErrorComponent =>
            context.read<ServicesCubit>().onFetchPopularServices,
          _ => context.read<ServicesCubit>().onFetch,
        };
        return FailureComponent(message: msg, onRetry: onRetry);
      },
    );
  }
}

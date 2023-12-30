part of '../../../home.exports.dart';

class HomeBodySliderWidget extends StatelessWidget {
  const HomeBodySliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      buildWhen: (_, curr) => curr.rebuildPackages,
      builder: (_, state) => AnimatedSwitcher(
        duration: AppConfig.animationDuration,
        child: switch (state.status) {
          BlocStatus.loading => SizedBox(
              height: 156.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (_, index) => BounceInDown(
                  from: index + 50,
                  child: ShimmerEffectWidget(
                    height: 156.0,
                    width: MediaQuery.sizeOf(context).width * 0.90,
                  ),
                ),
                separatorBuilder: (_, __) => const Gap(12.0),
                itemCount: 4,
              ),
            ),
          BlocStatus.failure => FadeIn(
              child: FailureComponent(
                message: state.errorMessage,
                onRetry: context.read<PackagesCubit>().onFetchPackages,
              ),
            ),
          _ => SliderWidget(
              // autoScroll: false,
              pages: [
                for (int index = 0; index < state.length; index++) ...[
                  HSSCard(
                    onPreview: () {},
                    onStart: () {},
                    margin: EdgeInsetsDirectional.only(
                      start: 16.0,
                      end: index == state.length - 1 ? 16.0 : 0.0,
                    ),
                    logo: state.packages[index].icon,
                    type: state.packages[index].package,
                  ),
                ],
              ],
            ),
        },
      ),
    );
  }
}

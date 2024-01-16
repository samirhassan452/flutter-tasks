part of '../../shared_feature.exports.dart';

class PopupDialog {
  static void showError(BuildContext context, {required String msg}) =>
      ElegantNotification.error(
        title: Text(
          "Error",
          style: AppStyle.boldFont.copyWith(
            color: AppColor.error300,
            fontSize: 16.0,
            height: 13.0 / 12.0,
          ),
        ),
        description: Text(
          msg,
          style: AppStyle.mediumFont.copyWith(
            color: AppColor.error300,
            fontSize: 12.0,
            height: 13.0 / 12.0,
          ),
        ),
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        animationDuration: AppConfig.animationDuration,
        background: AppColor.error50,
      ).show(context);
  static void showInfo(BuildContext context, {required String msg}) =>
      ElegantNotification.info(
        title: Text(
          "Info",
          style: AppStyle.boldFont.copyWith(
            color: Colors.lightBlue[900],
            fontSize: 16.0,
            height: 13.0 / 12.0,
          ),
        ),
        description: Text(
          msg,
          style: AppStyle.mediumFont.copyWith(
            color: Colors.lightBlue[900],
            fontSize: 12.0,
            height: 13.0 / 12.0,
          ),
        ),
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        animationDuration: AppConfig.animationDuration,
        // background: AppColor.error50,
      ).show(context);

  static Future<bool> showLoading(
    BuildContext context, {
    Color loadingColor = AppColor.primary900,
  }) async =>
      await show(
        context,
        child: Container(
          height: 50.0,
          alignment: Alignment.center,
          color: Colors.transparent,
          // child: LoadingWidget(color: loadingColor, size: 40),
          child: Pulse(
            infinite: true,
            child: Roulette(
              infinite: true,
              child: Image.asset(
                IconPath.favIcon,
                // scale: MediaQuery.of(context).size.shortestSide / 100,
              ),
            ),
          ),
        ),
      );

  static Future<bool> show(
    BuildContext context, {
    required Widget child,
  }) async =>
      (await showGeneralDialog<bool>(
        context: context,
        // Make the following property to false if you are using package
        useRootNavigator: false,
        transitionBuilder: (_, a1, a2, widget) {
          return PopScope(
            canPop: false,
            child: Transform.scale(
              scale: a1.value,
              child: Opacity(opacity: a1.value, child: child),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.6),
        barrierDismissible: false,
        // barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        },
      )) ??
      false;
}

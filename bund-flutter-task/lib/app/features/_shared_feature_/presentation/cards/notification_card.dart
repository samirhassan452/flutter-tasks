part of '../../shared_feature.exports.dart';

class NotificationCard extends StatelessWidget {
  final Color backgroundColor;
  final String description;
  final IconData icon;
  final VoidCallback? onClose;
  const NotificationCard({
    super.key,
    required this.backgroundColor,
    required this.description,
    required this.icon,
    this.onClose,
  });

  factory NotificationCard.success({
    required String description,
    VoidCallback? onClose,
  }) {
    return NotificationCard(
      backgroundColor: Colors.green[700]!,
      description: description,
      icon: Icons.check_circle_rounded,
      onClose: onClose,
    );
  }

  factory NotificationCard.error({
    required String description,
    VoidCallback? onClose,
  }) {
    return NotificationCard(
      backgroundColor: Colors.red[800]!,
      description: description,
      icon: Icons.error,
      onClose: onClose,
    );
  }

  factory NotificationCard.warning({
    required String description,
    VoidCallback? onClose,
  }) {
    return NotificationCard(
      backgroundColor: Colors.yellow[800]!,
      description: description,
      icon: Icons.warning,
      onClose: onClose,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButtonWidget(
                padding: const EdgeInsets.all(0.0),
                icon: const Icon(Icons.close, size: 18.0),
                size: 24.0,
                onTap: onClose ?? context.closeNotification,
              ),
              const Gap(10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    from: 50.0,
                    child: Swing(
                      infinite: true,
                      child: Icon(icon, color: AppColor.white, size: 28.0),
                    ),
                  ),
                  const Gap(10.0),
                  Flexible(
                    child: FadeInDown(
                      // delay: Duration(milliseconds: 100),
                      from: 50.0,
                      child: Text(
                        description,
                        style: AppStyle.semiBoldFont
                            .copyWith(color: AppColor.white, height: 1.7),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

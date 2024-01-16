part of '../../shared_feature.exports.dart';

class CheckboxUC extends StatelessWidget {
  final Widget child;
  const CheckboxUC({super.key, required this.child});

  CheckboxUC.rememberMe({
    super.key,
    required bool selected,
    ValueChanged<bool>? onChanged,
  }) : child = CheckboxWidget.label(
          selected: selected,
          label: "Remember Me",
          labelStyle: AppStyle.mediumFont.copyWith(
            fontSize: 12.0,
            color: AppColor.grey500,
            height: 13.0 / 12.0,
          ),
          onChanged: onChanged,
        );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

part of '../../shared_feature.exports.dart';

class TextFieldUC extends StatelessWidget {
  final Widget child;
  const TextFieldUC({super.key, required this.child});

  TextFieldUC.name({
    super.key,
    bool readOnly = false,
    String labelText = "First Name",
    String? initialValue,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) : child = TextFieldWidget(
          readOnly: readOnly,
          labelText: labelText,
          initialValue: initialValue,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            LengthLimitingTextInputFormatter(100),
            FilteringTextInputFormatter.deny(RegExp(r"\s")),
          ],
          errorText: errorText,
          onChanged: onChanged,
        );

  TextFieldUC.email({
    super.key,
    bool readOnly = false,
    String? initialValue,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) : child = TextFieldWidget(
          readOnly: readOnly,
          labelText: "Email Address",
          initialValue: initialValue,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          inputFormatters: [LengthLimitingTextInputFormatter(64)],
          errorText: errorText,
          onChanged: onChanged,
        );

  TextFieldUC.password({
    super.key,
    bool readOnly = false,
    String labelText = "Password",
    String? initialValue,
    String? errorText,
    bool visible = false,
    ValueChanged<bool>? onVisibleChanged,
    ValueChanged<String>? onChanged,
  }) : child = TextFieldWidget(
          readOnly: readOnly,
          labelText: labelText,
          initialValue: initialValue,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: !visible,
          errorText: errorText,
          suffixIcon: IconButton(
            onPressed: () => onVisibleChanged?.call(!visible),
            icon: FadeIn(
              key: ValueKey(visible),
              child: Icon(
                visible ? Icons.visibility : Icons.visibility_off,
                size: 18.0,
                color: AppColor.grey400,
              ),
            ),
          ),
          // suffixIcon: InkWell(
          //   onTap: () => onVisibleChanged?.call(!visible),
          //   child: FadeIn(
          //     key: ValueKey(visible),
          //     child: Icon(
          //       visible ? Icons.visibility : Icons.visibility_off,
          //       size: 18.0,
          //       color: AppColor.grey400,
          //     ),
          //   ),
          // ),
          onChanged: onChanged,
        );

  TextFieldUC.about({
    super.key,
    bool readOnly = false,
    String labelText = "About",
    String? initialValue,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) : child = TextFieldWidget(
          readOnly: readOnly,
          labelText: labelText,
          initialValue: initialValue,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          inputFormatters: [LengthLimitingTextInputFormatter(1000)],
          maxLines: 4,
          errorText: errorText,
          onChanged: onChanged,
        );

  TextFieldUC.birthDate({
    super.key,
    bool readOnly = false,
    String labelText = "Birth Date",
    DateTime? initialDate,
    String? errorText,
    ValueChanged<DateTime>? onDateSelected,
  }) : child = DatePickerWidget(
          readOnly: readOnly,
          labelText: labelText,
          initialDate: initialDate,
          firstDate: DateTime(1940, 1, 1),
          lastDate: DateTime(DateTime.now().year - 5, 12, 31),
          errorText: errorText,
          onDateSelected: onDateSelected,
        );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

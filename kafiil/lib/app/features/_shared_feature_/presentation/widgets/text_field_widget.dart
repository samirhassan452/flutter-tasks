part of '../../shared_feature.exports.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final TextStyle labelStyle;
  final int? labelMaxLines;
  final TextAlign labelTextAlign;
  final double gap;

  final TextEditingController? controller;
  final String? initialValue;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String obscuringCharacter;
  final bool obscureText;
  final int maxLines;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.labelStyle = AppStyle.inputLabel,
    this.labelMaxLines,
    this.labelTextAlign = TextAlign.start,
    this.gap = 8.0,
    this.controller,
    this.initialValue,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.maxLines = 1,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: labelStyle,
            maxLines: labelMaxLines,
            textAlign: labelTextAlign,
          ),
          Gap(gap),
        ],
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          maxLines: maxLines,
          autovalidateMode: autovalidateMode,
          inputFormatters: inputFormatters,
          style: AppStyle.inputValue,
          cursorWidth: 1.5,
          decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: prefixIcon != null
                ? Align(
                    // 0.0: center, 1.0: centerEnd, -1.0: centerStart
                    // 1.0 centerEnd / 2.0 extra space to move widget to actual alignment without losing padding or icon size
                    alignment: const AlignmentDirectional(1.0 / 2.0, 0.0),
                    child: prefixIcon,
                  )
                : null,
            // 20.0: padding + 18.0: size of icon + 2.0 extra space
            prefixIconConstraints: prefixIcon != null
                ? BoxConstraints.tight(const Size.square(18.0 + 20.0 + 2.0))
                : null,
            suffixIcon: suffixIcon != null
                ? Align(
                    // 0.0: center, 1.0: centerEnd, -1.0: centerStart
                    // -1.0 centerStart / 2.0 extra space to move widget to actual alignment without losing padding or icon size
                    alignment: const AlignmentDirectional(-1.0 / 2.0, 0.0),
                    child: suffixIcon,
                  )
                : null,
            // 20.0: padding + 18.0: size of icon + 2.0 extra space
            suffixIconConstraints: suffixIcon != null
                ? BoxConstraints.tight(const Size.square(18.0 + 20.0 + 2.0))
                : null,
            // suffixIconConstraints: suffixIcon != null
            //     ? BoxConstraints.tight(const Size.fromWidth(18.0 + 20.0 + 2.0))
            //     : null,
            // focusedBorder: readOnly ? InputBorder.none : null,
            focusedBorder:
                readOnly ? Theme.of(context).inputDecorationTheme.border : null,
          ),
          onTapOutside: onTapOutside,
          onChanged: onChanged,
          onTap: onTap,
        ),
      ],
    );
  }

  void onTapOutside(PointerDownEvent event) =>
      FocusManager.instance.primaryFocus?.unfocus();
}

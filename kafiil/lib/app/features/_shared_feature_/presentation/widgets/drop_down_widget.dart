part of '../../shared_feature.exports.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String? labelText;
  final TextStyle labelStyle;
  final int? labelMaxLines;
  final TextAlign labelTextAlign;
  final double gap;

  final bool readOnly;

  final TextEditingController? controller;
  final String? errorText;
  final T? initialSelection;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?)? onSelected;
  const DropDownWidget({
    super.key,
    this.labelText,
    this.labelStyle = AppStyle.inputLabel,
    this.labelMaxLines,
    this.labelTextAlign = TextAlign.start,
    this.gap = 8.0,
    this.readOnly = false,
    this.controller,
    this.errorText,
    this.initialSelection,
    required this.dropdownMenuEntries,
    this.onSelected,
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
        DropdownMenu<T>(
          enabled: readOnly == false,
          controller: controller,
          initialSelection: initialSelection,
          expandedInsets: EdgeInsets.zero,
          trailingIcon: const _TrailingIcon(quarterTurns: 3),
          selectedTrailingIcon: const _TrailingIcon(quarterTurns: 1),
          errorText: errorText,
          dropdownMenuEntries: dropdownMenuEntries,
          onSelected: onSelected,
        ),
      ],
    );
  }
}

//!
class _TrailingIcon extends StatelessWidget {
  final int quarterTurns;
  const _TrailingIcon({required this.quarterTurns});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColor.grey300,
        size: 16.0,
      ),
    );
  }
}

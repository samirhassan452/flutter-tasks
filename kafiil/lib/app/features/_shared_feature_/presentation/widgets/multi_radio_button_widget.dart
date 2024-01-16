part of '../../shared_feature.exports.dart';

class MultiRadioButtonWidget<T> extends StatefulWidget {
  final String? labelText;
  final TextStyle labelStyle;
  final int? labelMaxLines;
  final TextAlign labelTextAlign;
  final double labelGap;

  final bool readOnly;

  final double gap;
  final T? initialRadio;
  final List<({String label, T? value})> radios;
  final ValueChanged<T?>? onSelected;
  const MultiRadioButtonWidget({
    super.key,
    this.labelText,
    this.labelStyle = AppStyle.inputLabel,
    this.labelMaxLines,
    this.labelTextAlign = TextAlign.start,
    this.labelGap = 16.0,
    this.gap = 24.0,
    this.readOnly = false,
    this.initialRadio,
    this.radios = const [],
    this.onSelected,
  });

  @override
  State<MultiRadioButtonWidget<T>> createState() =>
      _MultiRadioButtonWidgetState<T>();
}

class _MultiRadioButtonWidgetState<T> extends State<MultiRadioButtonWidget<T>> {
  late ValueNotifier<T?> _selectedNotifier;

  @override
  void initState() {
    _selectedNotifier = ValueNotifier(widget.initialRadio);
    super.initState();
  }

  @override
  void dispose() {
    _selectedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: widget.labelStyle,
            maxLines: widget.labelMaxLines,
            textAlign: widget.labelTextAlign,
          ),
          Gap(widget.labelGap),
        ],
        ValueListenableBuilder<T?>(
          valueListenable: _selectedNotifier,
          builder: (_, groupValue, __) => Wrap(
            spacing: widget.gap,
            runSpacing: widget.gap,
            children: [
              for (final option in widget.radios) ...[
                RadioButtonWidget.label(
                  readOnly: widget.readOnly,
                  selfUpdated: false,
                  value: option.value,
                  groupValue: groupValue,
                  label: option.label,
                  labelStyle: AppStyle.mediumFont.copyWith(
                    fontSize: 14.0,
                    color: AppColor.grey900,
                    height: 15.0 / 14.0,
                  ),
                  onChanged: _onSelected,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }

  void _onSelected(T? value) {
    _selectedNotifier.value = value;
    widget.onSelected?.call(value);
  }
}

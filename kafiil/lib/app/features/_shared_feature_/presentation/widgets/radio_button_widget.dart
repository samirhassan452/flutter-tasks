part of '../../shared_feature.exports.dart';

class RadioButtonWidget<T> extends StatefulWidget {
  final bool readOnly;
  final bool selfUpdated;
  final T? value;
  final T? groupValue;
  final Widget? title;
  final ValueChanged<T?>? onChanged;
  const RadioButtonWidget({
    super.key,
    this.readOnly = false,
    this.selfUpdated = true,
    required this.value,
    required this.groupValue,
    this.title,
    this.onChanged,
  });

  RadioButtonWidget.label({
    super.key,
    this.readOnly = false,
    this.selfUpdated = true,
    required this.value,
    required this.groupValue,
    required String label,
    TextStyle? labelStyle,
    this.onChanged,
  }) : title = Text(label, style: labelStyle);

  @override
  State<RadioButtonWidget<T>> createState() => _RadioButtonWidgetState<T>();
}

class _RadioButtonWidgetState<T> extends State<RadioButtonWidget<T>> {
  late ValueNotifier<T?> _selectedNotifier;

  @override
  void initState() {
    _selectedNotifier = ValueNotifier(widget.groupValue);
    super.initState();
  }

  @override
  void dispose() {
    _selectedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<T?>(
          valueListenable: _selectedNotifier,
          builder: (_, groupValue, __) => Radio<T?>(
            value: widget.value,
            groupValue: widget.selfUpdated ? groupValue : widget.groupValue,
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: _onSelected,
          ),
        ),
        if (widget.title != null) ...[
          const Gap(12.0),
          Flexible(child: widget.title!),
        ],
      ],
    );
  }

  void _onSelected(T? value) {
    if (widget.readOnly) return;

    if (widget.selfUpdated) _selectedNotifier.value = value;
    widget.onChanged?.call(value);
  }
}

part of '../../shared_feature.exports.dart';

class MultiCheckboxWidget<T> extends StatefulWidget {
  final String? labelText;
  final TextStyle labelStyle;
  final int? labelMaxLines;
  final TextAlign labelTextAlign;
  final double labelGap;

  final bool readOnly;

  final double gap;
  final List<T> initialOptions;
  final List<({String label, T value})> options;
  final ValueChanged<List<T>>? onUpdatedOptions;
  final ValueChanged<List<T>>? onSelected;
  final ValueChanged<T>? onUnselected;
  const MultiCheckboxWidget({
    super.key,
    this.labelText,
    this.labelStyle = AppStyle.inputLabel,
    this.labelMaxLines,
    this.labelTextAlign = TextAlign.start,
    this.labelGap = 16.0,
    this.gap = 10.0,
    this.readOnly = false,
    this.initialOptions = const [],
    this.options = const [],
    this.onUpdatedOptions,
    this.onSelected,
    this.onUnselected,
  });

  @override
  State<MultiCheckboxWidget<T>> createState() => _MultiCheckboxWidgetState<T>();
}

class _MultiCheckboxWidgetState<T> extends State<MultiCheckboxWidget<T>> {
  late ValueNotifier<List<T>> _selectedNotifier;

  @override
  void initState() {
    _selectedNotifier = ValueNotifier(widget.initialOptions);
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
        ValueListenableBuilder<List<T>>(
          valueListenable: _selectedNotifier,
          builder: (_, options, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final option in widget.options) ...[
                CheckboxWidget.label(
                  readOnly: widget.readOnly,
                  selected: options.contains(option.value),
                  label: option.label,
                  labelStyle: AppStyle.mediumFont.copyWith(
                    fontSize: 14.0,
                    color: AppColor.grey900,
                    height: 15.0 / 14.0,
                  ),
                  onChanged: (_) => _onToggle(option.value),
                ),
                if (widget.options.last.value != option.value) Gap(widget.gap),
              ]
            ],
          ),
        ),
      ],
    );
  }

  void _onToggle(T value) {
    if (_selectedNotifier.value.contains(value) == false) {
      _onSelected(value);
    } else {
      _onUnselected(value);
    }
  }

  void _onSelected(T value) {
    _selectedNotifier.value = [..._selectedNotifier.value, value];
    widget.onSelected?.call(_selectedNotifier.value);
    widget.onUpdatedOptions?.call(_selectedNotifier.value);
  }

  void _onUnselected(T value) {
    _selectedNotifier.value = [..._selectedNotifier.value]..remove(value);
    widget.onUnselected?.call(value);
    widget.onUpdatedOptions?.call(_selectedNotifier.value);
  }
}

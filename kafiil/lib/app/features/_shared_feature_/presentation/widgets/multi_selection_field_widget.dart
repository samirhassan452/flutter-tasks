part of '../../shared_feature.exports.dart';

class MultiSelectionFieldWidget<T> extends StatefulWidget {
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
  final ValueChanged<T>? onDeleted;
  const MultiSelectionFieldWidget({
    super.key,
    this.labelText,
    this.labelStyle = AppStyle.inputLabel,
    this.labelMaxLines,
    this.labelTextAlign = TextAlign.start,
    this.labelGap = 8.0,
    this.gap = 8.0,
    this.readOnly = false,
    this.initialOptions = const [],
    this.options = const [],
    this.onUpdatedOptions,
    this.onSelected,
    this.onDeleted,
  });

  @override
  State<MultiSelectionFieldWidget<T>> createState() =>
      _MultiSelectionFieldWidgetState<T>();
}

class _MultiSelectionFieldWidgetState<T>
    extends State<MultiSelectionFieldWidget<T>> {
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
        SizedBox(
          height: 145.0,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.grey50,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: ValueListenableBuilder<List<T>>(
                valueListenable: _selectedNotifier,
                builder: (_, options, __) => Wrap(
                  spacing: widget.gap,
                  runSpacing: widget.gap,
                  children: [
                    for (final option in widget.options) ...[
                      Material(
                        color: options.contains(option.value)
                            ? AppColor.primary100
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius,
                          side: _borderSide(options.contains(option.value)),
                        ),
                        child: InkWell(
                          borderRadius: borderRadius,
                          onTap: () => _onToggle(option.value),
                          child: Padding(
                            padding: padding,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _Label(
                                  label: option.label,
                                  selected: options.contains(option.value),
                                ),
                                if (options.contains(option.value)) ...[
                                  const Gap(3.0),
                                  _DeleteIcon(
                                    onDelete: () => _onDelete(option.value),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                      /* InputChip(
                        selected: options.contains(option.value),
                        label: Text(option.label),
                        labelStyle: AppStyle.inputValue.copyWith(
                          color: options.contains(option.value)
                              ? AppColor.primary900
                              : null,
                          fontSize: 12.0,
                          height: 13.25 / 12.0,
                          letterSpacing: 0.24,
                        ),
                        labelPadding: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        deleteIconColor: AppColor.primary900,
                        deleteIcon: options.contains(option.value)
                            ? Icon(Icons.close, size: 16.0)
                            : SizedBox.shrink(),
                        showCheckmark: false,
                        selectedColor: AppColor.primary100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide.none,
                        ),
                        onPressed: () => _onSelected(option.value),
                        onDeleted: () => _onDelete(option.value),
                      ), */
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BorderSide _borderSide(bool selected) =>
      BorderSide(color: selected ? Colors.transparent : AppColor.grey300);
  BorderRadius get borderRadius => BorderRadius.circular(10.0);
  EdgeInsetsGeometry get padding =>
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0);

  void _onToggle(T value) {
    if (_selectedNotifier.value.contains(value) == false) {
      _onSelected(value);
    } else {
      _onDelete(value);
    }
  }

  void _onSelected(T value) {
    if (widget.readOnly) return;

    _selectedNotifier.value = [..._selectedNotifier.value, value];
    widget.onSelected?.call(_selectedNotifier.value);
    widget.onUpdatedOptions?.call(_selectedNotifier.value);
  }

  void _onDelete(T value) {
    if (widget.readOnly) return;

    _selectedNotifier.value = [..._selectedNotifier.value]..remove(value);
    widget.onDeleted?.call(value);
    widget.onUpdatedOptions?.call(_selectedNotifier.value);
  }
}

//!
class _Label extends StatelessWidget {
  final String label;
  final bool selected;
  const _Label({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppStyle.inputValue.copyWith(
        color: selected ? AppColor.primary900 : null,
        fontSize: 12.0,
        height: 13.25 / 12.0,
        letterSpacing: 0.24,
      ),
    );
  }
}

//!
class _DeleteIcon extends StatelessWidget {
  final VoidCallback onDelete;
  const _DeleteIcon({required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onDelete,
      icon: const Icon(
        Icons.close,
        size: 16.0,
        color: AppColor.primary900,
      ),
    );
  }
}

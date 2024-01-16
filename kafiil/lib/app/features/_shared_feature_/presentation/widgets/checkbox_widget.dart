part of '../../shared_feature.exports.dart';

class CheckboxWidget extends StatefulWidget {
  final bool readOnly;
  final bool selected;
  final Widget? title;
  final Size size;
  final ValueChanged<bool>? onChanged;
  const CheckboxWidget({
    super.key,
    this.readOnly = false,
    this.size = const Size(20.0, 20.0),
    required this.selected,
    this.title,
    this.onChanged,
  });

  CheckboxWidget.label({
    super.key,
    this.readOnly = false,
    this.size = const Size(20.0, 20.0),
    required this.selected,
    required String label,
    TextStyle? labelStyle,
    this.onChanged,
  }) : title = Text(label, style: labelStyle);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late ValueNotifier<bool> _selectedNotifier;

  @override
  void initState() {
    _selectedNotifier = ValueNotifier(widget.selected);
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
        SizedBox.fromSize(
          size: widget.size,
          child: ValueListenableBuilder<bool>(
            valueListenable: _selectedNotifier,
            builder: (_, selected, __) => AnimatedContainer(
              duration: AppConfig.animationDuration,
              decoration: BoxDecoration(
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.white,
                borderRadius: borderRadius,
                border: Border.fromBorderSide(border(selected)),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: borderRadius,
                child: InkWell(
                  onTap: _onToggle,
                  borderRadius: borderRadius,
                  child: AnimatedSwitcher(
                    duration: AppConfig.animationDuration,
                    child: switch (selected) {
                      (_) when selected => Icon(
                          Icons.check_rounded,
                          color: AppColor.white,
                          size: widget.size.width / 1.2,
                        ),
                      _ => const SizedBox.shrink(),
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.title != null) ...[
          const Gap(8.0),
          Flexible(child: widget.title!),
        ],
      ],
    );
  }

  BorderRadius get borderRadius => const BorderRadius.all(Radius.circular(4.0));

  BorderSide border(bool selected) =>
      selected ? BorderSide.none : const BorderSide(color: AppColor.grey300);

  void _onToggle() {
    if (widget.readOnly) return;

    _selectedNotifier.value = !_selectedNotifier.value;
    widget.onChanged?.call(_selectedNotifier.value);
  }
}

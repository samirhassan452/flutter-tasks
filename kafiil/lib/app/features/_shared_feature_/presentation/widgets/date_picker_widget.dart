part of '../../shared_feature.exports.dart';

class DatePickerWidget extends StatefulWidget {
  final String? labelText;
  final TextStyle labelStyle;
  final int? labelMaxLines;
  final TextAlign labelTextAlign;
  final double gap;

  final bool readOnly;

  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? errorText;
  final ValueChanged<DateTime>? onDateSelected;
  const DatePickerWidget({
    super.key,
    this.labelText,
    this.labelStyle = AppStyle.inputLabel,
    this.labelMaxLines,
    this.labelTextAlign = TextAlign.start,
    this.gap = 8.0,
    this.readOnly = false,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.errorText,
    this.onDateSelected,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    if (widget.initialDate != null) {
      _textController.text = widget.initialDate!.toDateFormat();
    }
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: _textController,
      labelText: widget.labelText,
      readOnly: true,
      errorText: widget.errorText,
      suffixIcon: IconButton(
        onPressed: _onOpenPicker,
        icon: const SvgWidget(IconPath.calendar, size: Size.square(18.0)),
      ),
      onTap: _onOpenPicker,
    );
  }

  void _onOpenPicker() async {
    if (widget.readOnly) return;

    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
      ),
      dialogSize: const Size(325, 400),
      value: [widget.initialDate ?? DateTime.now()],
      borderRadius: BorderRadius.circular(15),
    );

    if (results != null && results.isNotEmpty) {
      widget.onDateSelected?.call(results.first!);
      _textController.text = results.first!.toDateFormat();
    }
  }
}

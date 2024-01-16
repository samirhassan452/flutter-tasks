part of '../../shared_feature.exports.dart';

class SalaryComponent extends StatefulWidget {
  final bool readOnly;
  final num? initialSalary;
  final ValueChanged<num>? onSalaryChanged;
  const SalaryComponent({
    super.key,
    this.readOnly = false,
    this.initialSalary,
    this.onSalaryChanged,
  });

  @override
  State<SalaryComponent> createState() => _SalaryComponentState();
}

class _SalaryComponentState extends State<SalaryComponent> {
  late ValueNotifier<num> _salaryNotifier;

  @override
  void initState() {
    _salaryNotifier = ValueNotifier(widget.initialSalary ?? 100);
    super.initState();
  }

  @override
  void dispose() {
    _salaryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Salary", style: AppStyle.inputLabel),
        const Gap(8.0),
        Container(
          height: 56.0,
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColor.grey50,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: widget.readOnly
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceEvenly,
            children: [
              if (widget.readOnly == false)
                _IconButton(
                  icon: Icons.remove,
                  onPressed: _onDecrease,
                ),
              ValueListenableBuilder(
                valueListenable: _salaryNotifier,
                builder: (_, value, __) => Text(
                  "SAR $value",
                  style: AppStyle.inputValue,
                ),
              ),
              if (widget.readOnly == false)
                _IconButton(
                  icon: Icons.add,
                  onPressed: _onIncrease,
                ),
            ],
          ),
        ),
      ],
    );
  }

  void _onIncrease() {
    if (_salaryNotifier.value > 1000) return;

    _salaryNotifier.value += 100;
    widget.onSalaryChanged?.call(_salaryNotifier.value);
  }

  void _onDecrease() {
    if (_salaryNotifier.value < 100) return;

    _salaryNotifier.value -= 100;
    widget.onSalaryChanged?.call(_salaryNotifier.value);
  }
}

//!
class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _IconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: AppColor.primary900,
      constraints: BoxConstraints.tight(const Size.square(32.0)),
      style: IconButton.styleFrom(
        backgroundColor: AppColor.white,
        shadowColor: AppColor.black,
        elevation: 2.0,
      ),
      icon: Icon(icon, color: AppColor.primary900),
    );
  }
}

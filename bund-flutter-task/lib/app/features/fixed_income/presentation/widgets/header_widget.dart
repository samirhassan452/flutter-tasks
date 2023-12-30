part of '../../fixed_income.exports.dart';

class FixedIncomeHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const FixedIncomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Fixed Income',
        textAlign: TextAlign.center,
        style: AppStyle.appBar,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

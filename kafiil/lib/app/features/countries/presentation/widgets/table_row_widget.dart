part of '../../countries.exports.dart';

class CountriesTableRowWidget extends StatelessWidget {
  final bool isFirstRow;
  final bool isLastRow;
  final List<String> rowValues;
  const CountriesTableRowWidget({
    super.key,
    required this.isFirstRow,
    required this.isLastRow,
    required this.rowValues,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Row(
            children: [
              for (int index = 0; index < rowValues.length; index++) ...[
                Expanded(
                  child: AutoSizeText(
                    rowValues[index],
                    textAlign: TextAlign.center,
                    style: AppStyle.tableRow,
                    maxLines: 1,
                    maxFontSize: 12.0,
                    minFontSize: 8.0,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (isLastRow == false)
          const Divider(height: 1.0, color: AppColor.grey100)
      ],
    );
  }

  EdgeInsetsGeometry get padding =>
      const EdgeInsets.symmetric(horizontal: 6.0).copyWith(
        top: isFirstRow ? 0.0 : 8.0,
        bottom: isLastRow ? 0.0 : 12.0,
      );
}

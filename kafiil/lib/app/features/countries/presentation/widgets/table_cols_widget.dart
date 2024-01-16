part of '../../countries.exports.dart';

class CountriesTableColsWidget extends StatelessWidget {
  final List<String> tableColumns;
  const CountriesTableColsWidget({super.key, required this.tableColumns});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: tableColumnDecoration,
      child: Row(
        children: [
          for (var column in tableColumns) ...[
            Expanded(
              child: Text(
                column,
                textAlign: TextAlign.center,
                style: AppStyle.tableColumn,
              ),
            ),
          ],
        ],
      ),
    );
  }

  BoxDecoration get tableColumnDecoration => const BoxDecoration(
        color: AppColor.grey50,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      );
}

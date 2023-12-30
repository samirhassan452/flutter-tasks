part of '../../home.exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GlobalKey profileKey;
  late GlobalKey notificationKey;

  @override
  void initState() {
    super.initState();
    profileKey = GlobalKey();
    notificationKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (_) => Scaffold(
          appBar: HomeHeaderWidget(
            profileKey: profileKey,
            notificationKey: notificationKey,
          ),
          body: const HomeBodyWidget(),
        ),
      ),
    );
  }
}

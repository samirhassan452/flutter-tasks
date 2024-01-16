part of '../../login.exports.dart';

class LoginHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("Account Login"));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

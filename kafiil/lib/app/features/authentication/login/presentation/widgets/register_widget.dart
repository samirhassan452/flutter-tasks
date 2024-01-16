part of '../../login.exports.dart';

class LoginRegisterNewAccountWidget extends StatelessWidget {
  const LoginRegisterNewAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Don’t have an account ? ',
        style: AppStyle.mediumFont.copyWith(
          fontSize: 14.0,
          color: AppColor.grey500,
          height: 15.0 / 14.0,
        ),
        children: [
          TextSpan(
            text: 'Register',
            style: AppStyle.semiBoldFont.copyWith(
              fontSize: 14.0,
              color: AppColor.primary900,
              height: 15.0 / 14.0,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(context, RouteName.register),
          )
        ],
      ),
    );
  }
}

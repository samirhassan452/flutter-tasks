part of '../../login.exports.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Flash(
            child: ValidationErrorComponent(
              show: context.watch<LoginBloc>().state.isValidationFailed,
              margin: const EdgeInsets.only(top: 16.0),
            ),
          ),
          const Gap(32.0),
          FadeInDownBig(
            child: const Align(
              alignment: Alignment.center,
              child: SvgWidget(IconPath.loginCuate, size: Size.square(225.0)),
            ),
          ),
          const Gap(20.0),
          const LoginFormWidget(),
          const Gap(10.0),
          const LoginRememberMeWithForgetPasswordWidget(),
          const Gap(32.0),
          FadeInUpBig(
            from: 1800,
            child: Pulse(
              delay: const Duration(milliseconds: 1800),
              child: ElevatedButton(
                onPressed: () =>
                    context.read<LoginBloc>().add(const LoginOnSubmit()),
                child: const Text("Login"),
              ),
            ),
          ),
          const Gap(24.0),
          FadeInUpBig(
            from: 2400,
            child: const Align(
              alignment: Alignment.center,
              child: LoginRegisterNewAccountWidget(),
            ),
          ),
          const Gap(32.0),
        ],
      ),
    );
  }
}

part of '../../login.exports.dart';

class LoginRememberMeWithForgetPasswordWidget extends StatelessWidget {
  const LoginRememberMeWithForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FadeInLeftBig(
            from: 1200,
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (prev, curr) => prev.rememberMe != curr.rememberMe,
              builder: (_, state) => CheckboxUC.rememberMe(
                key: ValueKey(state.rememberMe),
                selected: state.rememberMe,
                onChanged: (state) => context
                    .read<LoginBloc>()
                    .add(LoginOnChangeInfo(rememberMe: state)),
              ),
            ),
          ),
        ),
        const Gap(10.0),
        Flexible(
          child: FadeInRightBig(
            from: 1200,
            child: TextButton(
              onPressed: () => PopupDialog.showInfo(
                context,
                msg: 'It will be available soon.',
              ),
              child: const Text("Forget Password?"),
            ),
          ),
        )
      ],
    );
  }
}

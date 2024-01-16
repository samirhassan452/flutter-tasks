part of '../../login.exports.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeftBig(
          child: BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (prev, curr) => prev.email != curr.email,
            builder: (_, state) => TextFieldUC.email(
              key: ValueKey(state.email),
              initialValue: state.email,
              errorText: state.emailErr,
              onChanged: (value) => context
                  .read<LoginBloc>()
                  .add(LoginOnChangeInfo(email: value)),
            ),
          ),
        ),
        const Gap(16.0),
        FadeInRightBig(
          child: BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (prev, curr) =>
                prev.password != curr.password ||
                prev.showPassword != curr.showPassword,
            builder: (_, state) => TextFieldUC.password(
              key: ValueKey(state.password),
              initialValue: state.password,
              errorText: state.passwordErr,
              visible: state.showPassword,
              onVisibleChanged: (visible) => context
                  .read<LoginBloc>()
                  .add(LoginOnChangeInfo(showPassword: visible)),
              onChanged: (value) => context
                  .read<LoginBloc>()
                  .add(LoginOnChangeInfo(password: value)),
            ),
          ),
        ),
      ],
    );
  }
}

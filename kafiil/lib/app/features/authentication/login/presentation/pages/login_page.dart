part of '../../login.exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(entryPointCubit: context.read<EntryPointCubit>())
        ..add(const LoginOnGetInfo()),
      child: Builder(
        builder: (_) => BlocListener<LoginBloc, LoginState>(
          listener: (_, state) async {
            switch (state.status) {
              case BlocStatus.closeLoading:
                Navigator.of(context).pop();
                break;
              case BlocStatus.postLoading:
                await PopupDialog.showLoading(context);
                break;
              case BlocStatus.postFailure:
                PopupDialog.showError(context, msg: state.errorMsg);
                break;
              case BlocStatus.postSuccess:
                Navigator.of(context)
                    .pushReplacementNamed(RouteName.bottomNavigation);
                break;
              default:
                break;
            }
          },
          child: const Scaffold(
            appBar: LoginHeaderWidget(),
            body: LoginBodyWidget(),
          ),
        ),
      ),
    );
  }
}

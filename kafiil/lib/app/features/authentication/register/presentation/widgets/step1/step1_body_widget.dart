part of '../../../register.exports.dart';

class RegisterStep1BodyWidget extends StatelessWidget {
  const RegisterStep1BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<RegisterStep1Bloc, RegisterStep1State>(
                  buildWhen: (prev, curr) => prev.fName != curr.fName,
                  builder: (_, state) => TextFieldUC.name(
                    initialValue: state.fName,
                    labelText: "First Name",
                    errorText: state.fNameErr,
                    onChanged: (value) => context
                        .read<RegisterStep1Bloc>()
                        .add(RegisterStep1OnChangeInfo(fName: value)),
                  ),
                ),
              ),
              const Gap(10.0),
              Expanded(
                child: BlocBuilder<RegisterStep1Bloc, RegisterStep1State>(
                  buildWhen: (prev, curr) => prev.lName != curr.lName,
                  builder: (_, state) => TextFieldUC.name(
                    initialValue: state.lName,
                    labelText: "Last Name",
                    errorText: state.lNameErr,
                    onChanged: (value) => context
                        .read<RegisterStep1Bloc>()
                        .add(RegisterStep1OnChangeInfo(lName: value)),
                  ),
                ),
              ),
            ],
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep1Bloc, RegisterStep1State>(
            buildWhen: (prev, curr) => prev.email != curr.email,
            builder: (_, state) => TextFieldUC.email(
              initialValue: state.email,
              errorText: state.emailErr,
              onChanged: (value) => context
                  .read<RegisterStep1Bloc>()
                  .add(RegisterStep1OnChangeInfo(email: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep1Bloc, RegisterStep1State>(
            buildWhen: (prev, curr) =>
                prev.password != curr.password ||
                prev.showPassword != curr.showPassword,
            builder: (_, state) => TextFieldUC.password(
              initialValue: state.password,
              errorText: state.passwordErr,
              visible: state.showPassword,
              onVisibleChanged: (visible) => context
                  .read<RegisterStep1Bloc>()
                  .add(RegisterStep1OnChangeInfo(showPassword: visible)),
              onChanged: (value) => context
                  .read<RegisterStep1Bloc>()
                  .add(RegisterStep1OnChangeInfo(password: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep1Bloc, RegisterStep1State>(
            buildWhen: (prev, curr) =>
                prev.password != curr.password ||
                prev.confirmPassword != curr.confirmPassword ||
                prev.showConfirmPassword != curr.showConfirmPassword,
            builder: (_, state) => TextFieldUC.password(
              initialValue: state.confirmPassword,
              labelText: "Confirm Password",
              errorText: state.confirmPasswordErr,
              visible: state.showConfirmPassword,
              onVisibleChanged: (visible) => context
                  .read<RegisterStep1Bloc>()
                  .add(RegisterStep1OnChangeInfo(showConfirmPassword: visible)),
              onChanged: (value) => context
                  .read<RegisterStep1Bloc>()
                  .add(RegisterStep1OnChangeInfo(confirmPassword: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep1Bloc, RegisterStep1State>(
            buildWhen: (prev, curr) =>
                prev.userTypes != curr.userTypes ||
                prev.userType != curr.userType,
            builder: (_, state) => DropDownWidget<int>(
              key: ValueKey("${state.userTypes.length}"),
              labelText: "User Type",
              errorText: state.userTypeErr,
              initialSelection: state.userType,
              dropdownMenuEntries: [
                for (var type in state.userTypes) ...[
                  DropdownMenuEntry(
                    value: type.value,
                    label: type.label.toTitleCase(),
                  ),
                ],
              ],
              onSelected: (value) => context
                  .read<RegisterStep1Bloc>()
                  .add(RegisterStep1OnChangeInfo(userType: value)),
            ),
          ),
        ],
      ),
    );
  }
}

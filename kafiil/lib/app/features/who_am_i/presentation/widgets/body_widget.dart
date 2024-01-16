part of '../../who_am_i.exports.dart';

class WhoAmIBodyWidget extends StatelessWidget {
  const WhoAmIBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        children: [
          Pulse(
            delay: const Duration(milliseconds: 1000),
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) => prev.user != curr.user,
              builder: (_, state) => AvatarComponent(
                readOnly: true,
                assetName: state.user?.avatar,
              ),
            ),
          ),
          const Gap(32.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FadeInLeftBig(
                  child: BlocBuilder<WhoAmICubit, WhoAmIState>(
                    buildWhen: (prev, curr) => prev.user != curr.user,
                    builder: (_, state) => TextFieldUC.name(
                      readOnly: true,
                      initialValue: state.user?.firstName,
                      labelText: "First Name",
                    ),
                  ),
                ),
              ),
              const Gap(10.0),
              Expanded(
                child: FadeInRightBig(
                  child: BlocBuilder<WhoAmICubit, WhoAmIState>(
                    buildWhen: (prev, curr) => prev.user != curr.user,
                    builder: (_, state) => TextFieldUC.name(
                      readOnly: true,
                      initialValue: state.user?.lastName,
                      labelText: "Last Name",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(16.0),
          FadeInLeftBig(
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) => prev.user != curr.user,
              builder: (_, state) => TextFieldUC.email(
                readOnly: true,
                initialValue: state.user?.email,
              ),
            ),
          ),
          const Gap(16.0),
          if (context.read<WhoAmICubit>().state.showPasswordField) ...[
            FadeInRightBig(
              child: BlocBuilder<WhoAmICubit, WhoAmIState>(
                buildWhen: (prev, curr) =>
                    prev.user != curr.user ||
                    prev.showPassword != curr.showPassword,
                builder: (_, state) => TextFieldUC.password(
                  readOnly: true,
                  initialValue: state.password,
                  visible: state.showPassword,
                  onVisibleChanged: context.read<WhoAmICubit>().onShowPassword,
                ),
              ),
            ),
            const Gap(16.0),
          ],
          ElasticIn(
            delay: const Duration(milliseconds: 600),
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) =>
                  prev.userTypes != curr.userTypes || prev.user != curr.user,
              builder: (_, state) => MultiRadioButtonWidget<int>(
                key: ValueKey("${state.userTypes.length}"),
                readOnly: true,
                labelText: "User Type",
                initialRadio: state.user?.type.code,
                radios: <({String label, int value})>[
                  for (final userType in state.userTypes)
                    (
                      label: userType.label.toTitleCase(),
                      value: userType.value
                    ),
                ],
              ),
            ),
          ),
          const Gap(16.0),
          FadeInLeftBig(
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) => prev.user != curr.user,
              builder: (_, state) => TextFieldUC.about(
                readOnly: true,
                initialValue: state.user?.about,
              ),
            ),
          ),
          const Gap(16.0),
          FadeInRightBig(
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) => prev.user != curr.user,
              builder: (_, state) => SalaryComponent(
                readOnly: true,
                initialSalary: state.user?.salary,
              ),
            ),
          ),
          const Gap(16.0),
          FadeInLeftBig(
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) => prev.user != curr.user,
              builder: (_, state) => TextFieldUC.birthDate(
                readOnly: true,
                initialDate: state.user?.birthDateAsDate,
              ),
            ),
          ),
          const Gap(16.0),
          ElasticIn(
            delay: const Duration(milliseconds: 600),
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) =>
                  prev.genders != curr.genders || prev.user != curr.user,
              builder: (_, state) => MultiRadioButtonWidget<int>(
                key: ValueKey("${state.genders.length}"),
                readOnly: true,
                labelText: "Gender",
                initialRadio: state.user?.gender,
                radios: <({String label, int value})>[
                  for (final gender in state.genders)
                    (label: gender.label.toTitleCase(), value: gender.value),
                ],
              ),
            ),
          ),
          const Gap(16.0),
          Pulse(
            delay: const Duration(milliseconds: 600),
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) =>
                  prev.tags != curr.tags || prev.user != curr.user,
              builder: (context, state) => MultiSelectionFieldWidget<int>(
                key: ValueKey("${state.user?.tags.length}"),
                readOnly: true,
                labelText: "Skills",
                initialOptions:
                    state.user?.tags.map((tag) => tag.id).toList() ?? const [],
                options: <({String label, int value})>[
                  for (final tag in state.user?.tags ?? const [])
                    (label: tag.name, value: tag.id),
                ],
              ),
            ),
          ),
          const Gap(16.0),
          Flash(
            delay: const Duration(milliseconds: 600),
            child: BlocBuilder<WhoAmICubit, WhoAmIState>(
              buildWhen: (prev, curr) =>
                  prev.socialMedias != curr.socialMedias ||
                  prev.user != curr.user,
              builder: (_, state) => MultiCheckboxWidget<String>(
                key: ValueKey("${state.user?.favoriteSocialMedia.length}"),
                readOnly: true,
                labelText: "Favourite Social Media",
                initialOptions: state.user?.favoriteSocialMedia ?? const [],
                options: <({String label, String value})>[
                  for (final social in state.socialMedias)
                    (label: social.label.toTitleCase(), value: social.value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

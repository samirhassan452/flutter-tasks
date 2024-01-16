part of '../../../register.exports.dart';

class RegisterStep2BodyWidget extends StatelessWidget {
  const RegisterStep2BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) => prev.avatar != curr.avatar,
            builder: (_, state) => AvatarComponent(
              onSelectedFile: (file) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(avatar: file)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) => prev.about != curr.about,
            builder: (_, state) => TextFieldUC.about(
              initialValue: state.about,
              errorText: state.aboutErr,
              onChanged: (value) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(about: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) => prev.salary != curr.salary,
            builder: (_, state) => SalaryComponent(
              initialSalary: state.salary,
              onSalaryChanged: (value) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(salary: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) => prev.birthDate != curr.birthDate,
            builder: (_, state) => TextFieldUC.birthDate(
              initialDate: state.birthDate,
              onDateSelected: (value) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(birthDate: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) =>
                prev.genders != curr.genders || prev.gender != curr.gender,
            builder: (_, state) => MultiRadioButtonWidget<int>(
              key: ValueKey("${state.genders.length}"),
              labelText: "Gender",
              initialRadio: state.gender,
              radios: <({String label, int value})>[
                for (var gender in state.genders) ...[
                  (label: gender.label.toTitleCase(), value: gender.value),
                ],
              ],
              onSelected: (value) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(gender: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) =>
                prev.tags != curr.tags ||
                prev.selectedTags != curr.selectedTags,
            builder: (context, state) => MultiSelectionFieldWidget<int>(
              key: ValueKey("${state.tags.length}"),
              labelText: "Skills",
              initialOptions: state.selectedTags,
              options: <({String label, int value})>[
                for (var tag in state.tags) ...[
                  (label: tag.label.toTitleCase(), value: tag.value),
                ],
              ],
              onUpdatedOptions: (value) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(tags: value)),
            ),
          ),
          const Gap(16.0),
          BlocBuilder<RegisterStep2Bloc, RegisterStep2State>(
            buildWhen: (prev, curr) =>
                prev.socialMedias != curr.socialMedias ||
                prev.selectedSocialMedias != curr.selectedSocialMedias,
            builder: (_, state) => MultiCheckboxWidget<String>(
              key: ValueKey("${state.socialMedias.length}"),
              labelText: "Favourite Social Media",
              initialOptions: state.selectedSocialMedias,
              options: <({String label, String value})>[
                for (var social in state.socialMedias) ...[
                  (label: social.label.toTitleCase(), value: social.value),
                ],
              ],
              onUpdatedOptions: (value) => context
                  .read<RegisterStep2Bloc>()
                  .add(RegisterStep2OnChangeInfo(socialMedias: value)),
            ),
          ),
        ],
      ),
    );
  }
}

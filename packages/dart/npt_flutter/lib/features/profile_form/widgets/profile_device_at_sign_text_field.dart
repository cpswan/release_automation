import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:npt_flutter/features/profile/profile.dart';
import 'package:npt_flutter/styles/sizes.dart';
import 'package:npt_flutter/util/form_validator.dart';

class ProfileDeviceAtSignTextField extends StatefulWidget {
  const ProfileDeviceAtSignTextField({super.key});

  @override
  State<ProfileDeviceAtSignTextField> createState() => _ProfileDeviceAtSignTextFieldState();
}

class _ProfileDeviceAtSignTextFieldState extends State<ProfileDeviceAtSignTextField> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(strings.deviceAtsign),
        gapH4,
        Text(
          strings.deviceAtsignDescription,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        gapH10,
        BlocSelector<ProfileBloc, ProfileState, String?>(
          selector: (ProfileState state) {
            if (state is ProfileLoadedState) {
              return state.profile.sshnpdAtsign;
            }
            return null;
          },
          builder: (BuildContext context, String? state) {
            if (state == null) return gap0;
            Future.microtask(() => controller.value =
                TextEditingValue(text: state, selection: TextSelection.collapsed(offset: state.length)));
            return SizedBox(
              width: Sizes.p300,
              height: Sizes.p80,
              child: TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormValidator.validateRequiredAtsignField,
                  onChanged: (value) {
                    if (!value.startsWith('@')) {
                      value = '@$value';
                    }
                    setState(() {
                      value = value.trim();
                    });

                    var bloc = context.read<ProfileBloc>();
                    bloc.add(ProfileEditEvent(
                      profile: (bloc.state as ProfileLoadedState).profile.copyWith(sshnpdAtsign: value),
                    ));
                  }),
            );
          },
        ),
      ],
    );
  }
}

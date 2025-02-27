import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:npt_flutter/features/settings/settings.dart';
import 'package:npt_flutter/features/settings/widgets/advance_section.dart';
import 'package:npt_flutter/features/settings/widgets/contact_list_tile.dart';
import 'package:npt_flutter/features/settings/widgets/default_relay_section.dart';
import 'package:npt_flutter/features/settings/widgets/language_section.dart';
import 'package:npt_flutter/widgets/custom_card.dart';
import 'package:npt_flutter/widgets/custom_text_button.dart';
import 'package:npt_flutter/widgets/spinner.dart';

import '../../../styles/sizes.dart';
import '../widgets/dashboard_section.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final deviceSize = MediaQuery.of(context).size;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsInitial) {
          context.read<SettingsBloc>().add(const SettingsLoadEvent());
        }
        switch (state) {
          case SettingsInitial():
          case SettingsLoading():
            return const Center(child: Spinner());
          case SettingsLoadedState():
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard.settingsRail(
                      height: deviceSize.height * Sizes.settingsCardHeightFactor,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          gapH10,
                          CustomTextButton.backUpYourKey(),
                          CustomTextButton.faq(),
                          CustomTextButton.email(),
                          CustomTextButton.discord(),
                          CustomTextButton.feedback(),
                          CustomTextButton.privacyPolicy(),
                          CustomTextButton.signOut(),
                          ContactListTile(),
                        ],
                      ),
                    ),
                    CustomCard.settingsContent(
                      height: deviceSize.height * Sizes.settingsCardHeightFactor,
                      width: deviceSize.width * Sizes.settingsCardWidthFactor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Sizes.p43,
                          right: Sizes.p33,
                          top: Sizes.p28,
                        ),
                        child: ListView(children: const [
                          SettingsErrorHint(),
                          DefaultRelaySection(),
                          gapH25,
                          DashboardSection(),
                          gapH25,
                          AdvanceSection(),
                          gapH25,
                          LanguageSection(),
                        ]),
                      ),
                    ),
                  ],
                ),
                Text(strings.allRightsReserved)
              ],
            );
        }
      },
    );
  }
}

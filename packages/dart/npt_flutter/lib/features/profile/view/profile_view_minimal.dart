import 'package:flutter/material.dart';
import 'package:npt_flutter/features/profile/profile.dart';
import 'package:npt_flutter/styles/sizes.dart';

class ProfileViewMinimal extends StatelessWidget {
  const ProfileViewMinimal({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final width = SizeConfig.setProfileFieldWidth();

      return Row(children: [
        const ProfileSelectBox(),
        gapW10,
        ProfileDisplayName(width: width),
        gapW10,
        ProfileStatusIndicator(width: SizeConfig.setProfileFieldWidth(statusField: true)),
        const Spacer(),
        const ProfileRunButton(),
        gapW10,
        const ProfileFavoriteButton(),
        gapW10,
        const ProfilePopupMenuButton(),
        gapW20,
      ]);
    });
  }
}

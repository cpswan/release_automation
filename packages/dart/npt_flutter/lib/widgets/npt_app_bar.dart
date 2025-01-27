import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:npt_flutter/styles/app_color.dart';
import 'package:npt_flutter/styles/style_constants.dart';

import '../styles/sizes.dart';

class NptAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? settingsSelectedColor;
  final bool isNavigateBack;
  final bool showSettings;
  // The width factor of the settings icon. This is used to calculate the right padding of the settings icon.
  final double settingsIconWidthFactor;

  const NptAppBar({
    super.key,
    this.title = '',
    this.settingsSelectedColor,
    this.isNavigateBack = true,
    this.showSettings = true,
    this.settingsIconWidthFactor = Sizes.settingsIconPaddingFactor,
  });

  @override
  Size get preferredSize => Size.fromHeight(isNavigateBack ? Sizes.p150 : Sizes.p100);

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return SizedBox(
      width: Sizes.p853,
      child: AppBar(
        titleSpacing: 0,
        leading: gap0,
        toolbarHeight: isNavigateBack ? Sizes.p150 : Sizes.p100,
        title: Row(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                gapH16,
                SvgPicture.asset(
                  'assets/noports_logo.svg',
                  height: Sizes.p54,
                  width: Sizes.p175,
                ),
                gapH16,
                isNavigateBack
                    ? TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: Text(
                          strings.back,
                        ),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                        style: StyleConstants.backButtonStyle,
                      )
                    : gap0,
              ],
            ),
            gapW27,
            Column(
              children: [
                Container(
                  color: AppColor.dividerColor,
                  height: Sizes.p38,
                  width: Sizes.p2,
                ),
                gapH25
              ],
            ),
            gapW20,
            Column(
              children: [
                Text(
                  title,
                ),
                gapH25,
              ],
            ),
          ],
        ),
        actions: [
          showSettings
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: Sizes.p30,
                    right: MediaQuery.of(context).size.width * settingsIconWidthFactor,
                  ),
                  child: TextButton.icon(
                    label: Text(strings.settings),
                    icon: Icon(
                      Icons.settings_outlined,
                      color: settingsSelectedColor,
                    ),
                    onPressed: () {
                      // the primary color is used when the navbar is on the settings screen and therefore the settings icon is not clickable.
                      if (settingsSelectedColor != AppColor.primaryColor) Navigator.pushNamed(context, '/settings');
                    },
                  ),
                )
              : gap0,
        ],
        centerTitle: true,
      ),
    );
  }
}

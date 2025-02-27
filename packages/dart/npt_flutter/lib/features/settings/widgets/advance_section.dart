import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../styles/sizes.dart';
import '../../../widgets/custom_container.dart';
import '../../logging/widgets/enable_logs_box.dart';
import '../../logging/widgets/export_logs_button.dart';

class AdvanceSection extends StatelessWidget {
  const AdvanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.apps),
            Text(strings.advanced),
            gapW4,
          ],
        ),
        gapH16,
        CustomContainer.background(
          child: Column(
            children: [
              Row(children: [
                const EnableLogsBox(),
                Text(strings.enableLogging),
                gapW20,
                const ExportLogsButton(),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

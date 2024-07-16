import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more/flipped_class_page.dart';
import 'package:dlc/pages/more/instructors_page.dart';
import 'package:dlc/pages/more/press_release_page.dart';
import 'package:dlc/pages/more/terms_of_use_page.dart';
import 'package:dlc/pages/more/widgets/morecard.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: unused_import
import 'package:dlc/routers.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body:
       Scaffold(

        body:Column(
      children: [
        const Padding(padding: EdgeInsets.all(10)),
        Center(
          child: Text(AppLocalizations.of(context)!.more,
              style: AppTextStyles.headline600),
        ),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          runSpacing: 4,
          children: [
            MoreCard(
              imagePath: "assets/images/more/flipped.png",
              title: AppLocalizations.of(context)!.flippedTitle,
              navigateTo: "flipped",
            ),
            MoreCard(
              imagePath: "assets/images/more/instructor.png",
              title: AppLocalizations.of(context)!.instructors,
              navigateTo: "instructor",
            ),
            MoreCard(
              imagePath: "assets/images/more/press.png",
              title: AppLocalizations.of(context)!.pressTitle,
              navigateTo: "press",
            ),
            MoreCard(
              imagePath: "assets/images/more/terms.png",
              title: AppLocalizations.of(context)!.termsOfUseTitle,
              navigateTo: "terms",
            ),
          ],
        )
      ],
        ),
       ),
  
    );
  }
}

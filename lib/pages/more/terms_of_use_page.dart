import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dlc/constants.dart/constants.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});

  @override
  _TermsOfUsePageState createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.termsOfUseTitle,
                    style: AppTextStyles.headline700,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!.lastUpdated,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.introText,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.agreementText,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!
                                  .intellectualPropertyTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!
                                  .intellectualPropertyText,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!
                                  .accessContentTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  AppLocalizations.of(context)!.accessContentText,
                            ),
                            TextSpan(
                              text:
                                  AppLocalizations.of(context)!.userContentTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.userContentText,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!
                                  .linksToOtherWebsitesTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!
                                  .linksToOtherWebsitesText,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.changesTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context)!.changesText,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}

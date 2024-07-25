import 'package:dlc/constants.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/layout.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PressReleasePage extends StatefulWidget {
  const PressReleasePage({super.key});

  @override
  State<PressReleasePage> createState() => _PressReleasePageState();
}

class _PressReleasePageState extends State<PressReleasePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Center(
                  child: Text(
                    AppLocalizations.of(context)!.pressTitle,
                    style: AppTextStyles.headline700,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(3)),
                    child:  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        AppLocalizations.of(context)!.pressRelease,
                        style: AppTextStyles.bodyText300,
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

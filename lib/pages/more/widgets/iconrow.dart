import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  

class IconRow extends StatelessWidget {
  final String messageUrl;
  final String phoneUrl;
  // final String linkedInUrl;

  const IconRow({
    super.key,
    required this.messageUrl,
    required this.phoneUrl,
    // required this.linkedInUrl,
  });

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchPhoneURL(String url) async {
    final Uri launchUri = Uri(
          scheme: 'tel',
          path: url,
        );
        await launchUrl(launchUri);
  }

  Future<void> _launchMailURL(String url) async {
    final Uri launchUri = Uri(
          scheme: 'mailto',
          path: url,
        );
        await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _launchPhoneURL(phoneUrl), 
          child: Image.asset("assets/images/instructors/icons/1.png"),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _launchMailURL(messageUrl), 
          child: Image.asset("assets/images/instructors/icons/2.png"),
        ),
        const SizedBox(width: 10),
        // GestureDetector(
        //   onTap: () => _launchURL(linkedInUrl),
        //   child: Image.asset("assets/images/instructors/icons/3.png"),
        // ),
      ],
    );
  }
}

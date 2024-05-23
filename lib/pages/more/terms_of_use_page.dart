import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/home.dart';
import 'package:dlc/pages/updates.dart';
import 'package:dlc/pages/more.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({Key? key}) : super(key: key);

  @override
  _TermsOfUsePageState createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UpdatesPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Terms of Use',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 20),
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Last Updated: Dec 27, 2017\n\n'
                              'Thank you for using Deerwalk Learning Center. Please read these Terms and Conditions carefully before accessing, using or obtaining any content or services provided by http://dlc.dwit.edu.np website operated by Deerwalk Learning Center. In these terms “we”, “us”, “our” or “DLC” refers to Deerwalk Learning Centre and “you” refers to you as a user of this website.\n\n'
                              'Your access to and use of the service is conditioned on your acceptance of and compliance with these terms. These terms apply to all visitors, users and others who access or use the service.\n\n',
                        ),
                        TextSpan(
                          text: 'BY ACCESSING OR USING THE SERVICE YOU AGREE TO BE BOUND BY THESE TERMS. IF YOU DISAGREE WITH ANY PART OF THE TERMS THEN YOU MAY NOT ACCESS THE SERVICE.\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Intellectual Property\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'All copyright, trademarks, design rights, patents and other intellectual '
                              'property rights (registered and unregistered) in and on DLC belong to DLC. '
                              'We reserve all of its rights. Nothing in the terms grants you a right or '
                              'license to use any trade mark, design right or copyright owned or controlled '
                              'by the DLC or any except as expressly provided in the terms.\n\n',
                        ),
                        TextSpan(
                          text: 'Access to Website Content\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'We may permit user to share the content of the website (Videos and teaching '
                              'materials) with a selected group of user or download the content of the '
                              'website for personal purpose. However, alternation of the content is strictly '
                              'restricted.\n\n',
                        ),
                        TextSpan(
                          text: 'User Content\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'We may permit the posting of questions, comments, ratings, reviews etc. by you. '
                              'You understand that whether or not such user content is published, we do not '
                              'guarantee any confidentiality with respect to any submissions.\n\n',
                        ),
                        TextSpan(
                          text: 'Links to Other Websites\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Our Service may contain links to third-party websites or services that are not '
                              'owned or controlled by us.\n\n'
                              'We have no control over, and assumes no responsibility for, the content, privacy '
                              'policies, or practices of any third party web sites or services. You further acknowledge '
                              'and agree we shall not be responsible or liable, directly or indirectly, for any '
                              'damage or loss caused or alleged to be caused by or in connection with use of or '
                              'reliance on any such content, goods or services available on or through any such '
                              'websites or services.\n\n',
                        ),
                        TextSpan(
                          text: 'Changes\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'We reserve the right, at our sole discretion, to modify or replace these terms at any '
                              'time. We can modify these terms at any time by posting a newer version in our website. '
                              'Please review the terms of use regularly for changes.',
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
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

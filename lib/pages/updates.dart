import 'package:flutter/material.dart';
import 'package:dlc/components/bottomnav.dart';
import 'package:dlc/components/topnavbar.dart';
import 'package:dlc/pages/more.dart';
import 'package:dlc/pages/layout.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {


  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: const Scaffold(

        body: const Center(
          child: Text('Updates Page Content', style: TextStyle(color: Colors.white),),
        ),

      ),
    );
  }
}

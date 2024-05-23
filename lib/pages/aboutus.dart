import 'package:flutter/material.dart';

class PressReleasePage extends StatelessWidget {
  const PressReleasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'About Us',
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
                       
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Text('Deerwalk Learning Center, DLC, is a not-for-profit education organization established in 2016.\n\n'
                            'DLC was founded with the aim of addressing the gap in the education system in Nepal. It is focused on developing and delivering video lectures and tutorials for grade I to Grade XII students based on the curriculum developed by Curriculum Development Center, Ministry of Education of Government of Nepal. DLC believes that this will help students, especially from public schools of Nepal who do not have access to teachers but have some kind of access to the internet.\n\n',
                         
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                                  textAlign: TextAlign.justify,
                                ),
                       ),
                       decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(3)
                       ),
                    ),
              
            ),
              ],
          ),
        ),
        ),
    );
  }
}
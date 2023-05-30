import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seniordes/pages/sginorregis.dart';
import 'package:seniordes/providers/data.dart';

import 'homepage.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Data>(
        builder: (context, value, child) {
          if (value.auth) {
            return const MyHomePage();
          } else {
            return const SignorRigster();
          }
        },
      ),
    );
  }
}

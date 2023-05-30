import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seniordes/pages/signinpage.dart';
import 'package:seniordes/pages/signuppage.dart';
import 'package:seniordes/providers/data.dart';

class SignorRigster extends StatefulWidget {
  const SignorRigster({super.key});

  @override
  State<SignorRigster> createState() => _SignorRigsterState();
}

class _SignorRigsterState extends State<SignorRigster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage(),
    );
  }
}

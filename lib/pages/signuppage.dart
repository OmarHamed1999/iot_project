import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool owner = false;
  bool member = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back)),
                          ],
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Create your acount',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent)),
                  hintText: 'Email ',
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box_rounded),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.greenAccent)),
                    hintText: 'Username '),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent)),
                  hintText: 'Password ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent)),
                  hintText: 'Confirm Password ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        owner = !owner;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                        color: owner ? Colors.green : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          'Owner',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        member = !member;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                        color: member ? Colors.green : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          'Member',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'Sing up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

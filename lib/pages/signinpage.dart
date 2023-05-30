import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seniordes/pages/signuppage.dart';
import 'package:seniordes/providers/data.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Data>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/images/smarthome.png'))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Column(
                        children: const [
                          Text(
                            'Remo',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'for smart home solutions',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.greenAccent)),
                    hintText: ' Username or Email ',
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 2, color: Colors.greenAccent)),
                      hintText: 'Password '),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  value.sginin();
                  value.usernamechnage(email.text);
                },
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an acount?'),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

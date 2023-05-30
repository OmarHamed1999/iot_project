// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:seniordes/providers/data.dart';

class Garden extends StatefulWidget {
  const Garden({super.key});

  @override
  State<Garden> createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  double water = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<Data>(
      builder: (context, value, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const Text(
                      'Garden',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                    child: CircularPercentIndicator(
                        radius: 130,
                        lineWidth: 20,
                        percent: value.garden[0].moist > value.water
                            ? 1
                            : value.garden[0].moist / value.water,
                        progressColor: Colors.greenAccent,
                        backgroundColor: Colors.greenAccent.shade100,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              value.garden[0].moist < value.water
                                  ? const Text(
                                      ' soil is dry ',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  : const Text(
                                      'soil is in a good condtion',
                                      style: TextStyle(fontSize: 15),
                                    ),
                              SizedBox(
                                height: 8,
                              ),
                              Text('Outside temperature:23.5')
                            ],
                          ),
                        ))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('water level '),
                    Slider(
                        activeColor: Colors.greenAccent,
                        inactiveColor: Colors.greenAccent.shade100,
                        min: 0,
                        max: 1024,
                        value: water == 0 ? value.water.toDouble() : water,
                        onChanged: (value1) {
                          setState(() {
                            water = value1;
                          });
                          value.water = water.toInt();
                        }),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Datafortempandhum(
                                temphum: value.water.toString(),
                                im: 'lib/images/water-drop.png'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Devices and Actions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              value.pumpgarden(!value.garden[0].pump);
                            },
                            child: Device(
                              status: value.garden[0].pump,
                              title: 'pump',
                              im: 'lib/images/water-pump.png',
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    ));
  }
}

class Datafortempandhum extends StatelessWidget {
  const Datafortempandhum({
    Key? key,
    required this.im,
    required this.temphum,
  }) : super(key: key);
  final String im;
  final String temphum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 100,
      decoration: const BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(
            height: 2,
          ),
          Center(
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(im)),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(temphum)
        ],
      ),
    );
  }
}

class Device extends StatelessWidget {
  const Device({
    Key? key,
    required this.title,
    required this.im,
    required this.status,
  }) : super(key: key);
  final String title;
  final String im;
  final bool status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.greenAccent),
      child: Column(
        children: [
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(im), fit: BoxFit.fill)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(title),
          const SizedBox(
            height: 5,
          ),
          Text(status ? 'on' : 'Off',
              style: TextStyle(color: status ? Colors.green : Colors.red))
        ],
      ),
    );
  }
}

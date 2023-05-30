// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:seniordes/providers/data.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  double temp = 0;
  double huemdty = 0;
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
                      'Living Room',
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
                        percent: 0.5,
                        progressColor: Colors.greenAccent,
                        backgroundColor: Colors.greenAccent.shade100,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${value.bedrooms[0].roomtemp.toStringAsFixed(1)} C ',
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                '5% ',
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Room',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '  Tempruture ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '  & ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '  humdity ',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 210,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('Room tempruture'),
                    Slider(
                        activeColor: Colors.greenAccent,
                        inactiveColor: Colors.greenAccent.shade100,
                        min: 0,
                        max: 50,
                        value: temp,
                        onChanged: (value) {
                          setState(() {
                            temp = double.parse(value.toStringAsFixed(2));
                          });
                        }),
                    const Text('Room humedety'),
                    Slider(
                        activeColor: Colors.greenAccent,
                        inactiveColor: Colors.greenAccent.shade100,
                        min: 0,
                        max: 50,
                        value: huemdty,
                        onChanged: (value) {
                          setState(() {
                            huemdty = double.parse(value.toStringAsFixed(2));
                          });
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
                                temphum: '${temp} C',
                                im: 'lib/images/cold.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Datafortempandhum(
                              temphum: '${huemdty} %',
                              im: 'lib/images/humidity.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
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
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                value.lightlivingroom(
                                    !value.livingroom[0].light);
                              },
                              child: Device(
                                title: 'Light',
                                im: 'lib/images/light-bulb.png',
                                status: value.livingroom[0].light,
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Device(
                              title: 'air conditioner',
                              im: 'lib/images/air-conditioner.png',
                              status: true,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Device(
                              title: 'Window',
                              im: 'lib/images/window.png',
                              status: true,
                            ),
                          ],
                        ),
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
          SizedBox(
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
          SizedBox(
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
          SizedBox(
            height: 3,
          ),
          Container(
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(im), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(title),
          SizedBox(
            height: 5,
          ),
          Text(
            status ? 'On' : 'off',
            style: TextStyle(color: status ? Colors.green : Colors.red),
          )
        ],
      ),
    );
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seniordes/pages/bedroom.dart';
import 'package:seniordes/pages/garden.dart';
import 'package:seniordes/providers/data.dart';
import 'package:seniordes/utlity/dev.dart';

import '../utlity/im.dart';
import 'livingroom.dart';
import 'notifcpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool sleep = false;
  bool travel = false;
  bool sw = false;
  bool swfornotfi = true;
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: Consumer<Data>(
      builder: (context, value, child) {
        return Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/images/smarthome.png'))),
              )),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.black54,
                    leading: Icon(Icons.account_box),
                    title: Text('Acount'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.black54,
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    trailing: Switch(
                      value: swfornotfi,
                      onChanged: (value1) {
                        setState(() {
                          swfornotfi = value1;
                        });
                        value.turnnotfic(swfornotfi);
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.black54,
                    leading: Icon(Icons.autorenew),
                    title: Text('Automation'),
                    trailing: Switch(
                      value: value.aotumation,
                      onChanged: (value1) {
                        setState(() {
                          value.aotumation = value1;
                        });
                        if (value1) {
                          value.sendnotfc(value1);
                        } else {
                          value.sendnotfc(value1);
                        }
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.black54,
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  value.sginin();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 144, 149),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Sing out ',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ), body: Consumer<Data>(
      builder: (context, value, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('lib/images/user.png'))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value.username,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(child: Text('Owner')),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 210,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 45,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return NotficPage();
                                    },
                                  ));
                                },
                                icon: value.notfic.isEmpty
                                    ? Image.asset(
                                        'lib/images/notification-bell.png')
                                    : Image.asset(
                                        'lib/images/notification.png')),
                          ),
                          Positioned(
                            left: 90,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: AssetImage('lib/images/man.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Positioned(
                            left: 120,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: AssetImage('lib/images/user.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Positioned(
                            left: 155,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: AssetImage('lib/images/user1.png'),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/images/cold.png'))),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                                'Temp \n ${value.bedrooms[0].roomtemp.toStringAsFixed(1)}C')
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 110,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/fire-alarm.png'))),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                                'smoke \n ${((value.livingroom[0].smoke / 460) * 100).toStringAsFixed(1)} %')
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 100,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/humidity.png'))),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('Hum \n 5%')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text('Your', style: TextStyle(fontSize: 25)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Room',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Text('add'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.add_box_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const BedRoom();
                          },
                        ));
                      },
                      child: const Image1(
                        im: 'lib/images/bedroom.png',
                        title: 'Bed Room',
                        dev: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const Garden();
                          },
                        ));
                      },
                      child: const Image1(
                        im: 'lib/images/gardening.png',
                        title: 'Garden',
                        dev: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const LivingRoom();
                          },
                        ));
                      },
                      child: const Image1(
                        im: 'lib/images/living-room.png',
                        title: 'Living Room',
                        dev: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text(
                        'Alarms',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 185,
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Text('add'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.add_box_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 28,
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/images/door.png'))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                value.alarms[0].door ? 'opned' : 'Closed',
                                style: TextStyle(
                                    color: sw ? Colors.green : Colors.red,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text('Your', style: TextStyle(fontSize: 25)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'appliances',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Text('add'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.add_box_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        value.airon(!value.bedrooms[0].aircondtiner);
                      },
                      child: Devices(
                          im: 'lib/images/air-conditioner.png',
                          title: 'Air-Conditioner',
                          status: value.bedrooms[0].aircondtiner),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.pumpgarden(!value.garden[0].pump);
                      },
                      child: Devices(
                          im: 'lib/images/water-pump.png',
                          title: 'Water-Pump',
                          status: value.garden[0].pump),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.lightbed(!value.bedrooms[0].light);
                      },
                      child: Devices(
                          im: 'lib/images/light-bulb.png',
                          title: 'Light',
                          status: value.bedrooms[0].light),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text(
                        'Routines ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 162,
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Text('add'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.add_box_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Switch(
                              activeColor: Colors.green,
                              value: sleep,
                              onChanged: (value1) {
                                setState(() {
                                  sleep = value1;
                                });
                                if (value1) {
                                  value.sleep();
                                } else {
                                  value.aotumation = true;
                                  value.sendnotfc(true);
                                }
                              },
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/nighttime.png'))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                sleep ? 'Active' : 'Active',
                                style: TextStyle(
                                    color: sleep ? Colors.green : Colors.red,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Switch(
                              activeColor: Colors.green,
                              value: travel,
                              onChanged: (value1) {
                                setState(() {
                                  travel = value1;
                                });
                                if (value1) {
                                  value.travel();
                                } else {
                                  value.aotumation = true;
                                  value.sendnotfc(true);
                                }
                              },
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/images/plane.png'))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                travel ? 'Active' : 'Active',
                                style: TextStyle(
                                    color: travel ? Colors.green : Colors.red,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    ));
  }
}

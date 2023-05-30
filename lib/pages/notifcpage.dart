import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';

class NotficPage extends StatefulWidget {
  const NotficPage({super.key});

  @override
  State<NotficPage> createState() => _NotficPageState();
}

class _NotficPageState extends State<NotficPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Data>(
        builder: (context, value, child) {
          return SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 250,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back)),
                            const Text(
                              'Notifications',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black87),
                        child: const Center(
                            child: Text(
                          'Owner',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              value.notfic.isEmpty
                  ? const Text('No notficaton')
                  : Flexible(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              tileColor: Colors.black87,
                              leading: Image.asset('lib/images/siren.png'),
                              title: Text(value.notfic[index].title),
                              subtitle: Text(
                                  '${value.notfic[index].time.day.toString()}/${value.notfic[index].time.month.toString()}/${value.notfic[index].time.year.toString()}-${value.notfic[index].time.hour.toString()}:${value.notfic[index].time.minute.toString()}'),
                              trailing: IconButton(
                                  onPressed: () {
                                    value.deletenotfic(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          );
                        },
                        itemCount: value.notfic.length,
                      ),
                    )
            ],
          ));
        },
      ),
    );
  }
}

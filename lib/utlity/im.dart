import 'package:flutter/material.dart';

class Image1 extends StatelessWidget {
  final String im;
  final String title;
  final int dev;
  const Image1(
      {super.key, required this.im, required this.title, required this.dev});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(im), fit: BoxFit.fill))),
            const SizedBox(
              height: 5,
            ),
            Text(title),
            const SizedBox(
              height: 5,
            ),
            Text(' ${dev} devices connected')
          ],
        ),
      ),
    );
  }
}

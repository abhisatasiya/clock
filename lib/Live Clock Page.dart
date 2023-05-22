import 'dart:math';
import 'package:flutter/material.dart';
class LiveWatch extends StatefulWidget {

  const LiveWatch({Key? key}) : super(key: key);
  @override
  State<LiveWatch> createState() => _LiveWatchState();
}
class _LiveWatchState extends State<LiveWatch> {
  int s = 0;
  int m = 0;
  int h = 0;
  void timer() {
    Future.delayed(
      const Duration(seconds: 1),
          () {
        setState(() {
          s = DateTime.now().second;
          m = DateTime.now().minute;
          h = (DateTime.now().hour - 12) * 5;
          timer();
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    timer();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();

            },
            child: Icon(
              Icons.watch_later_outlined,
              size: height * 0.04,
              color: Colors.white70,
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...List.generate(
              60,
                  (index) => Transform.rotate(
                angle: (index * pi) / 30,
                child: Divider(
                  color: index % 5 == 0 ? Colors.red : Colors.grey,
                  thickness: height * 0.004,
                  indent: height * 0.04,
                  endIndent: index % 5 == 0 ? width * 0.85 : width * 0.88,
                ),
              ),
            ),
            Transform.rotate(
              angle: ((s + 15) * pi) / 30,
              child: Divider(
                color: Colors.white,
                indent: 60,
                thickness: height * 0.004,
                endIndent: width / 2,
              ),
            ),
            Transform.rotate(
              angle: ((m + 15) * pi) / 30,
              child: Divider(
                color: Colors.white,

                thickness: height * 0.007,
                indent: 75,
                endIndent: width * 0.5,
              ),
            ),
            Transform.rotate(
              angle: ((h + 15) * pi) / 30,
              child: Divider(
                color: Colors.white,
                thickness: height * 0.01,
                indent: 95,
                endIndent: width * 0.5,
              ),
            ),
            Container(
              height: height * 0.025,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(
                  width: 2,
                  color: Colors.white24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
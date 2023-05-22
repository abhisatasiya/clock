import 'dart:math';
import 'package:flutter/material.dart';
class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}
class _StopWatchState extends State<StopWatch> {
  int s = 0;
   int m =0;
  int h =0;
  int i =0;

    bool start = false;
    List<Map> time = [];
    void timer() {
      setState(() {
        if (start == true) {
          Future.delayed(
            const Duration(seconds: 1),
                () {
              setState(() {
                if (start) {
                  s++;
                }
                if (s > 59) {
                  m++;
                  s -= 60;
                }
                if (m > 59) {
                  h++;
                  m -= 60;
                }
              });
              timer();
            },
          );
        }
      });
    }
    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      double height = size.height;

      double width = size.width;
      return Scaffold(
          appBar: AppBar(
          actions: [
          GestureDetector(
          onTap: () {
        Navigator.of(context).pushNamed('LiveTime');
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
      backgroundColor: Colors.white24,
      elevation: 0,
      ),
      backgroundColor: Colors.brown,
      body: Column(
      children: [
      Expanded(
      flex: 15,
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
      color: Colors.grey.shade300,
      indent: 60,
      thickness: height * 0.004,
      endIndent: width / 2,
      ),
      ),
      Transform.rotate(
      angle: ((m + 15) * pi) / 30,
      child: Divider(
      color: Colors.grey,
      thickness: height * 0.007,
      indent: 75,
      endIndent: width * 0.5,
      ),
      ),
      Transform.rotate(
      angle: ((h + 15) * pi) / 6,
      child: Divider(
      color: Colors.grey,
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
      color: Colors.grey,
            ),
          ),
         ),
          ],
          ),
         ),
     },
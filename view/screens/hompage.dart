import 'dart:math';
import 'package:flutter/material.dart';
class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}
class _StopWatchState extends State<StopWatch> {
  int s = 0;
  int m = 0;
  int h = 0;
  int i = 0;
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
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
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
                    color: Colors.grey,
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
          const Spacer(),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                children: [
                  ...time.map(
                        (e) => Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(height * 0.015),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: height * 0.04,
                            right: height * 0.04,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${e['index']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${e['hour']} : ${e['minute']} : ${e['second']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                setState(() {
                  if (start == false) {
                    start = true;
                    timer();
                  }
                });
              },
              icon: const Icon(
                Icons.timer,
              ),
            ),
            label: "Play",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                setState(() {
                  start = false;
                });
              },
              icon: const Icon(Icons.stop),
            ),
            label: "Stop",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                setState(() {
                  i++;
                  time.add(
                    {
                      'index': i,
                      'second': s,
                      'minute': m,
                      'hour': h,
                    },
                  );
                });

              },
              icon: const Icon(
                Icons.flag,
              ),
            ),
            label: "Flag",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                setState(() {
                  start = false;
                  s = 0;
                  m = 0;
                  h = 0;
                  i = 0;
                  time = [];
                });
              },
              icon: const Icon(
                Icons.refresh_rounded,
              ),
            ),
            label: "Restart",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white70,
        elevation: 0,
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int value = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool equal = false;
    var type = value.runtimeType;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Calculator')),
      body: Container(
        color: Colors.amber,
        height: height * 1.0,
        width: width * 1.0,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                // height: height * .5,
                width: width * 1,
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: height * .5,
                width: width * 1,
                color: Colors.white,
                child: Column(
                  children: [
                    // SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          type == double
                              ? Text(
                                  value.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 45),
                                )
                              : Text(
                                  '$value',
                                  style: TextStyle(fontSize: 45),
                                ),
                        ],
                      ),
                    ),
                    // buttonsRow(
                    //   value: false,
                    //   title1: 'AC',
                    //   title2: '8',
                    //   title3: '7',
                    //   title4: Icon(Icons.add),
                    // ),
                    // buttonsRow(
                    //   value: false,
                    //   title1: '9',
                    //   title2: '8',
                    //   title3: '7',
                    //   title4: Icon(Icons.remove),
                    // ),
                    // buttonsRow(
                    //   value: false,
                    //   title1: '6',
                    //   title2: '5',
                    //   title3: '4',
                    //   title4: Icon(CupertinoIcons.multiply),
                    // ),
                    // buttonsRow(
                    //   value: false,
                    //   title1: '3',
                    //   title2: '2',
                    //   title3: '1',
                    //   title4: Icon(CupertinoIcons.divide),
                    // ),
                    // buttonsRow(
                    //   value: false,
                    //   title1: '0',
                    //   title2: '0',
                    //   title3: '.',
                    //   title4: Icon(CupertinoIcons.equal),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    value = 0;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  'AC',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    value ~/= 10;
                                    // value -= value;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.clear_fill),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value != 0) {
                                      value = value ~/ 100;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.percent),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.divide),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    // value = 9;
                                    if (value == 0) {
                                      value = 9;
                                    } else {
                                      value *= 10;
                                      value += 9;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '9',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 8;
                                    } else {
                                      value *= 10;
                                      value += 8;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '8',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 7;
                                    } else {
                                      value *= 10;
                                      value += 7;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '7',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (equal == true) {
                                      value *= value;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.multiply),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 6;
                                    } else {
                                      value *= 10;
                                      value += 6;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '6',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 5;
                                    } else {
                                      value *= 10;
                                      value += 5;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '5',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 4;
                                    } else {
                                      value *= 10;
                                      value += 4;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '4',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.minus),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 3;
                                    } else {
                                      value *= 10;
                                      value += 3;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 2;
                                    } else {
                                      value *= 10;
                                      value += 2;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (value == 0) {
                                      value = 1;
                                    } else {
                                      value *= 10;
                                      value += 1;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.plus),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.cube_box),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '0',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Text(
                                  '.',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            child: Container(
                              height: height * 0.075,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    equal = true;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: Icon(CupertinoIcons.equal),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class buttons extends StatelessWidget {
//   String title;
//   buttons({required this.title});
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//       child: Container(
//         height: height * 0.08,
//         width: width * 0.18,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.1),
//           ],
//         ),
//         child: MaterialButton(
//           onPressed: () {},
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusGeometry.circular(20),
//           ),
//           child: Text(title, style: TextStyle(fontSize: 25)),
//         ),
//       ),
//     );
//   }
// }

// class buttonsRow extends StatelessWidget {
//   String title1, title2, title3;
//   bool value;
//   Icon title4;
//   buttonsRow({
//     required this.title1,
//     required this.title2,
//     required this.title3,
//     required this.title4,
//     required this.value,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//             child: Container(
//               height: height * 0.075,
//               width: width * 0.18,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 0.1,
//                     spreadRadius: 0.1,
//                   ),
//                 ],
//               ),
//               child: MaterialButton(
//                 onPressed: () {},
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadiusGeometry.circular(20),
//                 ),
//                 child:  value ? Icon() : Text(title1, style: TextStyle(fontSize: 25)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//             child: Container(
//               height: height * 0.075,
//               width: width * 0.18,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 0.1,
//                     spreadRadius: 0.1,
//                   ),
//                 ],
//               ),
//               child: MaterialButton(
//                 onPressed: () {},
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadiusGeometry.circular(20),
//                 ),
//                 child: Text(title2, style: TextStyle(fontSize: 25)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//             child: Container(
//               height: height * 0.075,
//               width: width * 0.18,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 0.1,
//                     spreadRadius: 0.1,
//                   ),
//                 ],
//               ),
//               child: MaterialButton(
//                 onPressed: () {},
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadiusGeometry.circular(20),
//                 ),
//                 child: Text(title3, style: TextStyle(fontSize: 25)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//             child: Container(
//               height: height * 0.075,
//               width: width * 0.18,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 0.1,
//                     spreadRadius: 0.1,
//                   ),
//                 ],
//               ),
//               child: MaterialButton(
//                 onPressed: () {},
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadiusGeometry.circular(20),
//                 ),
//                 child: title4,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

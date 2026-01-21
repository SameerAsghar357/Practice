// ignore_for_file: must_be_immutable

import 'package:covid_tracker/countriesList.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsPage extends StatefulWidget {
  const WorldStatsPage({Key? key}) : super(key: key);

  @override
  State<WorldStatsPage> createState() => _WorldStatsPageState();
}

final colorList = <Color>[
  const Color(0xff4285F4),
  const Color(0xff1aa260),
  const Color(0xffde5246),
];

class _WorldStatsPageState extends State<WorldStatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          const PieChart(
            colorList: [
              Color(0xff4285F4),
              Color(0xff1aa260),
              Color(0xffde5246),
            ],
            dataMap: {"Total": 20.0, "Effected": 15.0, "Deaths": 5.0},
            chartRadius: 200.0,
            chartValuesOptions:
                ChartValuesOptions(showChartValuesInPercentage: true),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 5,
                ),
                child: Column(
                  children: [
                    Reusablerow(title: 'Deaths', value: "78954536"),
                    Reusablerow(title: 'Recovered', value: "46532"),
                    Reusablerow(title: 'Damaged', value: "5616542"),
                    Reusablerow(title: 'Today Deaths', value: "51"),
                    Reusablerow(title: 'Today Recovered', value: "894"),
                    Reusablerow(title: 'Affected', value: "546"),
                    Reusablerow(title: 'Nothing', value: "200551"),
                    Reusablerow(title: 'Today', value: "80546515"),
                    Reusablerow(title: 'Today Affected', value: "400651"),
                    Reusablerow(title: 'Having', value: "4006551"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CountrieslistPage()));
              },
              height: 50,
              color: const Color(0xff1aa260),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Track Countries'),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const CountrieslistPage()));
          //     },
          // child: Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //     color: const Color(0xff1aa260),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: const Center(
          //       child: Text(
          //     'Track Countries',
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          //       )),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Reusablerow extends StatelessWidget {
  String title, value;
  Reusablerow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(value)],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

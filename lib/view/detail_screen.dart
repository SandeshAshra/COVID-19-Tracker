import 'package:flutter/material.dart';
import 'package:untitled/view/world_states.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final int totalCases, totalRecovered, totalDeaths, active, critical, todayRecovered, test;
  const DetailScreen({super.key,
    required this.name,
    required this.image,
    required this.todayRecovered,
    required this.totalCases,
    required this.active,
    required this.critical,
    required this.totalRecovered,
    required this.test,
    required this.totalDeaths,


  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .06,),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(image),
                        ),
                        ReuseableRow(
                            title: 'Cases', value: totalCases.toString()),
                        ReuseableRow(
                            title: 'Recovered', value: totalRecovered.toString()),
                        ReuseableRow(
                            title: 'Deaths', value: totalDeaths.toString()),
                        ReuseableRow(
                            title: 'Active', value: active.toString()),
                        ReuseableRow(
                            title: 'Critical', value: critical.toString()),
                        ReuseableRow(
                            title: 'Today Recovered', value: todayRecovered.toString()),
                        ReuseableRow(
                            title: 'Tests', value: test.toString()),


                      ],
                    ),
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}

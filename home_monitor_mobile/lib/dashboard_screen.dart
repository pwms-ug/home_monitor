import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notion_budget/configure_meter_screen.dart';

import 'meter_reading.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => AddMeterScreen(),
                    ),
                  )
                },
                child: Card(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 34,
                        ),
                        Text(
                          "Configure\nMeter",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => {},
                child: Card(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 34,
                        ),
                        Text("Add Meter")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => MeterReadingScreen(),
                    ),
                  )
                },
                child: Card(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.read_more,
                          size: 34,
                        ),
                        Text(
                          "Meter\nReadings",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

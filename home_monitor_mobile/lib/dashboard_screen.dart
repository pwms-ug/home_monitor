import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        Text("Add Meter")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => {

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
                        Text("Add Meter")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => {

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
                        Text("Meter\nReadings", textAlign: TextAlign.center,)
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

import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_notion_budget/configure_meter_screen.dart';

import 'budget_repository.dart';
import 'failure_model.dart';
import 'meter_reading_screen.dart';
import 'models/MeterReading.dart';

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
          child: Column(
            children: [
              Container(
                height: 120,
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
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                child: SimpleTimeSeriesChart.withSampleData(),
              )
            ],
          ),
        ));
  }
}

class SimpleTimeSeriesChart extends StatefulWidget {
  final List<Series<dynamic, DateTime>> seriesList;

  SimpleTimeSeriesChart(this.seriesList);

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
    );
  }

  @override
  State<SimpleTimeSeriesChart> createState() => _SimpleTimeSeriesChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class _SimpleTimeSeriesChartState extends State<SimpleTimeSeriesChart> {
  late Future<List<MeterReading>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = BudgetRepository().getMeterReadings();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data! as List<MeterReading>;
            var date = DateTime.parse(items[0].date);
            print("=================================");
            print(date);
            return new charts.TimeSeriesChart(
              widget.seriesList,
              animate: true,
              dateTimeFactory: const charts.LocalDateTimeFactory(),
            );
          } else if (snapshot.hasError) {
            final failure = snapshot.error as Failure;
            return Center(child: Text(failure.message));
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

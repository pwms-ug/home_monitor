import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_notion_budget/models/MeterReading.dart';
import './budget_repository.dart';
import './failure_model.dart';
import './item_model.dart';
import './spending_chart.dart';
import 'package:intl/intl.dart';

import 'dashboard_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Monitor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DashboardScreen(),
    );
  }
}
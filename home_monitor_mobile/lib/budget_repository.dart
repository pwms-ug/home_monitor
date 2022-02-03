import 'dart:convert';

import 'package:flutter_notion_budget/failure_model.dart';
import 'package:http/http.dart' as http;

import 'models/MeterReading.dart';

class BudgetRepository {
  static const String _baseUrl = 'https://monitor4home.herokuapp.com/api/';

  final http.Client _client;

  BudgetRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<MeterReading>> getMeterReadings() async {
    try {
      final url = '${_baseUrl}meter_readings/readings';
      final response = await _client.get(
        Uri.parse(url),
        headers: {},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        return data.map((e) {
          print(e);
          return MeterReading.fromMap(e);
        }).toList();
      } else {
        throw const Failure(message: 'Something went wrong!');
      }
    } catch (_) {
      throw const Failure(message: 'Something went wrong!');
    }
  }
}

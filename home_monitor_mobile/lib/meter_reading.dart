import 'package:flutter/material.dart';

import 'budget_repository.dart';
import 'failure_model.dart';
import 'models/MeterReading.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  late Future<List<MeterReading>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = BudgetRepository().getMeterReadings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Monitor'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _futureItems = BudgetRepository().getMeterReadings();
          setState(() {});
        },
        child: FutureBuilder<List<MeterReading>>(
          future: _futureItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Show pie chart and list view of items.
              final items = snapshot.data!;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: getCategoryColor("Food"),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(item.meterNumber),
                      subtitle: Text(
                        '${item.reading} • ${item.date}',
                      ),
                      trailing: Text(
                        '${(item.reading * 3500).toStringAsFixed(2)}/=',
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              // Show failure error message.
              final failure = snapshot.error as Failure;
              return Center(child: Text(failure.message));
            }
            // Show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Color getCategoryColor(String category) {
  switch (category) {
    case 'Entertainment':
      return Colors.red[400]!;
    case 'Food':
      return Colors.green[400]!;
    case 'Personal':
      return Colors.blue[400]!;
    case 'Transportation':
      return Colors.purple[400]!;
    default:
      return Colors.orange[400]!;
  }
}

import 'package:flutter/material.dart';

class AddMeterScreen extends StatefulWidget {
  const AddMeterScreen({Key? key}) : super(key: key);

  @override
  _AddMeterScreenState createState() => _AddMeterScreenState();
}

class _AddMeterScreenState extends State<AddMeterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configure New Meter"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.compass_calibration),
                    hintText: 'Meter Number',
                    labelText: 'Meter Number',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_city),
                    hintText: 'Location',
                    labelText: 'Location',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 40.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () => {
                          Navigator.pop(context)
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

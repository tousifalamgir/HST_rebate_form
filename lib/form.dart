import 'package:flutter/material.dart';

class HstForm extends StatefulWidget {
  const HstForm({super.key});

  @override
  State<HstForm> createState() => _HstFormState();
}

class _HstFormState extends State<HstForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('submit'),
          )
        ],
        ),
    );
  }
}

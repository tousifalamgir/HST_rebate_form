import 'package:flutter/material.dart';

class HstForm extends StatefulWidget {
  const HstForm({super.key});

  @override
  State<HstForm> createState() => _HstFormState();
}

class _HstFormState extends State<HstForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [

            ],
          )
        ],
        ),
    );
  }
}

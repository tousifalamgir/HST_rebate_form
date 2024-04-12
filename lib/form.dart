import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hst_rebate_form/pdf_form.dart';


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
          Row(
            children: <Widget>[
                Text('Label: '),
                Expanded(
                  child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                                ),
                ),
            ]
          ),
          Row(
            children: <Widget>[
                Text('Label2: '),
                Expanded(
                  child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                                ),
                ),
            ]
          ),
          ElevatedButton(
            onPressed: () async {
              final pdfFile =
                  await PdfApi.generateCenteredText('Hello, World!');
              PdfApi.openFile(pdfFile);
            },
            child: const Text('submit'),
          )
        ],
        ),
    );
  }
}

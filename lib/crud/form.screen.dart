import 'package:flutter/material.dart';
import 'package:realtime/crud/common.screen.dart';
import 'package:realtime/theming.dart';

class FormElement {
  final String name;
  final String label;
  dynamic value;
  late TextEditingController _controller;
  FormElement({required this.name, required this.label, this.value}) {
    this._controller = TextEditingController(text: this.value);
  }
}

class FormScreen extends StatefulWidget {
  final List<FormElement> formElements;
  FormScreen({Key? key, required this.formElements}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late List<FormElement> formElements;
  final GlobalKey _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    formElements = widget.formElements;
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
        body: Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            ...this.buildElements(context),
            SizedBox(height: 24),
            Row(
              children: [
                TextButton(
                    child: Text('Back'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            )
          ]),
        ),
      ),
    ));
  }

  buildElements(BuildContext context) {
    return this.formElements.map((element) {
      return Column(
        children: [
          TextFormField(
            controller: element._controller,
            style: TextStyle(color: Theme.of(context).primaryColor),
            decoration: InputDecoration(
              labelText: element.label,
            ),
          ),
          SizedBox(height: 16)
        ],
      );
    }).toList();
  }
}

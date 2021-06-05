import 'package:flutter/material.dart';
import 'package:realtime/crud/common.screen.dart';
import 'package:realtime/crud/form.screen.dart';

final double SPACING = 16;
final COLOR = Colors.black54;

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text('HOME', style: TextStyle(color: Colors.pink))),
                Tab(
                    child:
                        Text('OTHERS', style: TextStyle(color: Colors.pink))),
                Tab(
                    child:
                        Text('SETTINGS', style: TextStyle(color: Colors.pink))),
              ],
            ),
          ),
          body: TabBarView(children: [
            Center(child: Text('Home')),
            Center(child: Text('Others')),
            Center(child: Text('Settings')),
          ]),
        ));
  }

  Widget addVSpace({double factor = 1}) => SizedBox(height: (SPACING * factor));

  /// Create Element
  openForm() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormScreen(formElements: [
        FormElement(name: 'firstname', label: 'Firstname'),
        FormElement(name: 'lastname', label: 'Lastname'),
      ]);
    }));
  }
}

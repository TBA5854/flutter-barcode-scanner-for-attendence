import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

List li = [1, 2, 3, 4, 5];

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: li.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(li[index].toString()),
          onTap: () => Navigator.restorablePushNamed(
            context,
            "Test",
            arguments: {
              'Title':"Title ${li[index].toString()}",
              'Desc':"Description ${li[index].toString()}",
              'Club':"Club ${li[index].toString()}",
              'Type':"Type ${li[index].toString()}",
              'Venue':"Venue ${li[index].toString()}",
              'TimeDate':"TimeDate ${li[index].toString()}",
              'Coordinators':"Coordinators ${li[index].toString()}",
              'ContactInfo':"ContactInfo ${li[index].toString()}",
            },
          ),
          onLongPress: () => setState(() {}),
          isThreeLine: true,
          subtitle: Row(
            children: [
              Text("Club 1"),
              Text("Type"),
              Text("Date"),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        );
      },
    ));
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Map test = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body:ListView(
        children: [
          ListTile(
            title: Text('Title'),
            subtitle: Text(test['Title'].toString()),
          ),
          ListTile(
            title: Text('Description'),
            subtitle: Text(test['Desc'].toString()),
          ),
          ListTile(
            title: Text('Club'),
            subtitle: Text(test['Club'].toString()),
          ),
          ListTile(
            title: Text('Type'),
            subtitle: Text(test['Type'].toString()),
          ),
          ListTile(
            title: Text('Venue'),
            subtitle: Text(test['Venue'].toString()),
          ),
          ListTile(
            title: Text('TimeDate'),
            subtitle: Text(test['TimeDate'].toString()),
          ),
          ListTile(
            title: Text('Coordinators'),
            subtitle: Text(test['Coordinators'].toString()),
          ),
          ListTile(
            title: Text('ContactInfo'),
            subtitle: Text(test['ContactInfo'].toString()),
          ),
          
          // ListTile(
          //   title: Text(test['Title'].toString()),
          //   subtitle: Text(test['Desc'].toString()),
          // ),
          // ListTile(
          //   title: Text(test['Club'].toString()),
          //   subtitle: Text(test['Type'].toString()),
          // ),
          // ListTile(
          //   title: Text(test['Venue'].toString()),
          //   subtitle: Text(test['TimeDate'].toString()),
          // ),
          // ListTile(
          //   title: Text(test['Coordinators'].toString()),
          //   subtitle: Text(test['ContactInfo'].toString()),
          // ),
        ], 
      ),
      //   body: TextButton(
      // child: Text(ModalRoute.of(context)!.settings.arguments.toString()),
      // onPressed: () => Navigator.pop(context),
      // onLongPress: () => setState(() {}),
      
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

List<Widget> skillList = [
  Item('Guitar'),
  Item('Coding'),
  Item('Handstand'),
  Item('Animation'),
  Item('Web Design'),
  Item('Machine Learning')
];

// List<Widget> skillList = [Item('Only Skill')];

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //final iterList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool editMode = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Skills"),
          backgroundColor: Colors.red,
          actions: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
          ],
        ),
        body: ListView(
          children: [
            //...[for (int i in iterList) Item("Skill " + i.toString())],
            ...skillList,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (!editMode)
                  ? FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(
                          () {
                            editMode = true;
                          },
                        );
                      },
                    )
                  : TextField(
                      controller: TextEditingController(),
                      decoration:
                          InputDecoration(hintText: "Enter new skill here"),
                      onSubmitted: (string) {
                        setState(() {
                          editMode = false;
                          skillList.add(Item(string));
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  final name;
  Item(this.name);

  @override
  _ItemState createState() => _ItemState();

  void remove() {
    skillList.remove(this);
  }
}

class _ItemState extends State<Item> {
  int hrs = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 7,
              child: ListTile(
                subtitle: Text("hrs: " + hrs.toString()),
                title: Text(
                  widget.name,
                  style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                shape: CircleBorder(),
                child: Text('+1'),
                onPressed: () {
                  setState(() {
                    hrs++;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                shape: CircleBorder(),
                child: Text('+10'),
                onPressed: () {
                  setState(() {
                    hrs += 10;
                  });
                },
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  skillList.remove(widget);
                  runApp(App());
                },
                icon: Icon(
                  Icons.delete,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}

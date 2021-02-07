import 'package:flutter/material.dart';

void main() {
  runApp(MyContactsApp());
}

class Contact {
  String address;
  String email;
  String firstName;
  String lastName;
  String phone;

  Contact(this.firstName,
      [this.lastName, this.address, this.phone, this.email]);
}

List<Contact> contacts = [
  Contact(
    'John',
    'Doe',
    '1222 Daisy Ave, Long Beach, CA 90813 US',
    '+15624376767',
  ),
  Contact(
    'Jane',
    'Pomala',
    '+18596232090',
    'Jane.P@workplace.com',
  ),
];

class MyContactsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildContactItems(Contact contact) {
    return Stack(
      children: <Widget>[
        ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              "${contact.firstName[0]}${contact.lastName[0]}",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          title: Text("${contact.firstName} ${contact.lastName}",
              style: TextStyle(fontSize: 25.0)),
        ),
        Positioned.fill(
          child: Material(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyDetailsPage(contact: contact),
                ),
              ),
              splashColor: Colors.transparent,
            ),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => _buildContactItems(contacts[index]),
        itemCount: contacts.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          endIndent: 15.0,
          indent: 15.0,
          thickness: 2.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        tooltip: 'Add A New Contact',
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyDetailsPage extends StatefulWidget {
  MyDetailsPage({Key key, @required this.contact}) : super(key: key);

  final Contact contact;

  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                'Name',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              child: Text(
                '${widget.contact.firstName ??= ''} ${widget.contact.lastName ??= ''}',
                style: TextStyle(fontSize: 35.0),
              ),
              padding: EdgeInsets.only(top: 15.0),
            ),
            Container(
              child: Text(
                'Address',
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.only(top: 30.0),
            ),
            Container(
              child: Text(
                '${widget.contact.address ??= ''}',
                style: TextStyle(fontSize: 35.0),
              ),
              padding: EdgeInsetsDirectional.only(top: 20.0),
            ),
            Container(
              child: Text(
                'Phone Number',
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.only(top: 30.0),
            ),
            Container(
              child: Text(
                '${widget.contact.phone ??= ''}',
                style: TextStyle(fontSize: 35.0),
              ),
              padding: EdgeInsetsDirectional.only(top: 20.0),
            ),
            Container(
              child: Text(
                'Email',
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.only(top: 30.0),
            ),
            Container(
              child: Text(
                '${widget.contact.email ??= ''}',
                style: TextStyle(fontSize: 35.0),
              ),
              padding: EdgeInsetsDirectional.only(top: 20.0),
            ),
            Container(
              child: Text(
                'Others',
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.only(top: 30.0),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}

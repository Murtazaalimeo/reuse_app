import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reuse/recyclepage.dart';

import 'data/login.dart';
import 'home.dart';
import 'myPost.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return MyPost();
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.tealAccent[700],
              ),
              accountName: Text("Harshad Sonawane"),
              accountEmail: Text("Sonawaneharshad1999@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60")),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text("Harshad"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text("Email"),
              subtitle: Text("sonawaneharshad1999@gmail.com"),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              leading: Icon(
                Icons.phone_android,
              ),
              title: Text("Phone no."),
              subtitle: Text("8169359012"),
              trailing: Icon(Icons.phone),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'we Recycle ♾',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Righteous', fontSize: 30.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
        elevation: 15.0,
        backgroundColor: Colors.tealAccent[700],
      ),
      body: LoginScreen(),
    );
  }
}

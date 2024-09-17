// recycle_page.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reuse/data/login.dart';
import 'package:reuse/new.dart';

class RecyclePage extends StatefulWidget {
  @override
  _RecyclePageState createState() => _RecyclePageState();
}

class _RecyclePageState extends State<RecyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('Items', style: TextStyle(fontFamily: 'Righteous', fontSize: 30.0)),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
    backgroundColor: Colors.tealAccent[700],
    ),
    body: ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCard(context, 'Newspaper', 'assets/images/Newspaper.png'),
                    _buildCard(context, 'Automobile', 'assets/images/automobile.png'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCard(context, 'Metal', 'assets/images/metal.png'),
                  _buildCard(context, 'Batteries', 'assets/images/batteries.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCard(context, 'Cloth', 'assets/images/cloth.png'),
                  _buildCard(context, 'Furniture', 'assets/images/furniture.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCard(context, 'Glass', 'assets/images/glass.png'),
                  _buildCard(context, 'Paint', 'assets/images/paint.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCard(context, 'Plastic', 'assets/images/plastic.png'),
                ],
              ),
            ],
          ),
        ),
      ],
    )
    );
  }

  // Function to create a Card widget
  Widget _buildCard(BuildContext context, String productName, String assetPath) {
    return Card(
      elevation: 3.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPost(productName: productName, productImage: assetPath,),
            ),
          );
        },
        child: Image(
          width: 120.0,
          height: 120.0,
          image: AssetImage(assetPath),
        ),
      ),
    );
  }
}

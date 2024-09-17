import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Post',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Righteous', fontSize: 30.0),
        ),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print('clicked');
              })
        ],
        elevation: 15.0,
        backgroundColor: Colors.tealAccent[700],
      ),
      body: _Post(),
    );
  }
}

class _Post extends StatefulWidget {
  @override
  __PostState createState() => __PostState();
}

class __PostState extends State<_Post> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1517061493161-6f312d1c36d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Product Name : Newspape',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Address : Mumbai-400086',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Phone No. :8169359012',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Weight :25kg',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Expected price :25rs',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1535673774336-ef95d2851cf3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Product Name : Paint',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Address : Mumbai-400079',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Phone No. :8169359012',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Expected price :25rs',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1524802020103-aa46eaffcaa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Product Name : Cans',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Address : Mumbai-400079',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Phone No. :8169359012',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Weight :5kg',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                              Text(
                                'Expected price :5rs',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Righteous'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

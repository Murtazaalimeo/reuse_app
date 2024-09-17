import 'package:flutter/material.dart';

import 'myPost.dart';

class Paint extends StatefulWidget {
  @override
  _PaintState createState() => _PaintState();
}

class _PaintState extends State<Paint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Paint',
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
      body: _Form(),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.2,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.2 - 27,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                ),
                Center(
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      height: 54.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Product Name',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
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
                              "https://images.unsplash.com/photo-1503596476-1c12a8ba09a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      height: 54.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1.0),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Address',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      height: 54.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1.0),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: 'Phone No.',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      height: 54.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1.0),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Kg (optional)',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      height: 54.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1.0),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Expected price in Rs.',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Post',
                        style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyPost()),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

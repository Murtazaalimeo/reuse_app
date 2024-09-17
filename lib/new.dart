import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reuse/postscreen.dart';

class MyPost extends StatelessWidget {
  final String productName;
  final String productImage;

  MyPost({required this.productName, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          productName,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Righteous',
            fontSize: 30.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 15.0,
        backgroundColor: Colors.tealAccent[700],
      ),
      body: _PostForm(productName: productName, productImage: productImage),
    );
  }
}

class _PostForm extends StatefulWidget {
  final String productName;
  final String productImage;

  _PostForm({required this.productName, required this.productImage});

  @override
  __PostFormState createState() => __PostFormState();
}

class __PostFormState extends State<_PostForm> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _kgController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _initializeNotification();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _kgController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _kgController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _initializeNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _showNotification(String productName) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Application Received',
      'Your application for $productName has been received and will be processed.',
      platformChannelSpecifics,
    );
  }

  void _submitPost() async {
    if (_formKey.currentState!.validate()) {
      final post = {
        'productName': widget.productName,
        'productImage': widget.productImage,
        'address': _addressController.text,
        'phone': _phoneController.text,
        'kg': _kgController.text,
        'price': _priceController.text,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('posts').add(post);

      _showNotification(widget.productName);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostsScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please correct the errors in the form')));
    }
  }

  Widget _buildFormField({
    required String hint,
    required TextInputType keyboardType,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Container(
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
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          validator: validator,
        ),
      ),
    );
  }

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
                          initialValue: widget.productName,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Product Name',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.productImage),
                          ),
                        ),
                      ),
                      _buildFormField(
                        hint: 'Address',
                        keyboardType: TextInputType.text,
                        controller: _addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),
                      _buildFormField(
                        hint: 'Phone No.',
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          }
                          final regex = RegExp(r'^03\d{9}$');
                          if (!regex.hasMatch(value)) {
                            return 'Invalid phone number format';
                          }
                          return null;
                        },
                      ),
                      _buildFormField(
                        hint: 'Kg (optional)',
                        keyboardType: TextInputType.number,
                        controller: _kgController,
                      ),
                      _buildFormField(
                        hint: 'Expected price in Rs.',
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Expected price is required';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        child: const Text(
                          'Post',
                          style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),
                        ),
                        onPressed: _submitPost,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

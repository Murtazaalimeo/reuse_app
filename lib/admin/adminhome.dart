import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final _formKey = GlobalKey<FormState>();
  final _itemController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _stepsController = TextEditingController();
  final _benefitsController = TextEditingController();
  final List<String> _steps = [];
  final List<String> _benefits = [];
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false; // Add this flag to manage loading state

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No image selected')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
    }
  }

  Future<String> _uploadImage(File file) async {
    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageRef.putFile(file);
    await uploadTask.whenComplete(() => null);
    String imageUrl = await storageRef.getDownloadURL();
    return imageUrl;
  }

  Future<void> _addRecyclingDetail() async {
    if (_formKey.currentState!.validate() && _imageFile != null) {
      setState(() {
        _isLoading = true; // Show loader
      });

      try {
        String imageUrl = await _uploadImage(_imageFile!);

        await FirebaseFirestore.instance.collection('recycling_details').add({
          'item': _itemController.text,
          'description': _descriptionController.text,
          'imagePath': imageUrl,
          'steps': _steps,
          'benefits': _benefits,
        });

        _itemController.clear();
        _descriptionController.clear();
        _stepsController.clear();
        _benefitsController.clear();
        setState(() {
          _steps.clear();
          _benefits.clear();
          _imageFile = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Recycling detail added successfully')));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add recycling detail: $e')));
      } finally {
        setState(() {
          _isLoading = false; // Hide loader
        });
      }
    } else if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select an image')));
    }
  }

  void _addStep() {
    if (_stepsController.text.isNotEmpty) {
      setState(() {
        _steps.add(_stepsController.text);
        _stepsController.clear();
      });
    }
  }

  void _addBenefit() {
    if (_benefitsController.text.isNotEmpty) {
      setState(() {
        _benefits.add(_benefitsController.text);
        _benefitsController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin - Add Recycling Detail'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Recycling Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _itemController,
                decoration: InputDecoration(
                  labelText: 'Item',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter an item name';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a description';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _stepsController,
                decoration: InputDecoration(
                  labelText: 'Step',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _addStep,
                child: Text('Add Step'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              ..._steps.map((step) => ListTile(title: Text(step))).toList(),
              SizedBox(height: 16),
              TextFormField(
                controller: _benefitsController,
                decoration: InputDecoration(
                  labelText: 'Benefit',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _addBenefit,
                child: Text('Add Benefit'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              ..._benefits.map((benefit) => ListTile(title: Text(benefit))).toList(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              _imageFile != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.file(_imageFile!, height: 150),
              )
                  : Text('No image selected'),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _addRecyclingDetail,
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Save All Details'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

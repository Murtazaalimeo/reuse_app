import 'package:flutter/material.dart';

class RecyclingDetailScreen extends StatelessWidget {
  final String id;
  final String item;
  final String description;
  final String imagePath;
  final List<dynamic> steps;
  final List<dynamic> advantages;

  RecyclingDetailScreen({
    required this.id,
    required this.item,
    required this.description,
    required this.imagePath,
    required this.steps,
    required this.advantages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                item,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Steps:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: steps.map((step) => Text(
                  step.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )).toList(),
              ),
              SizedBox(height: 16.0),
              Text(
                'Advantages:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: advantages.map((advantage) => Text(
                  advantage.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

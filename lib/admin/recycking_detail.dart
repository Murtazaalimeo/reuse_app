import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecyclingDetailsList extends StatelessWidget {
  Future<void> _deleteRecyclingDetail(String id, String imagePath) async {
    try {
      // Delete the Firestore document
      await FirebaseFirestore.instance.collection('recycling_details').doc(id).delete();

      // Delete the image from Firebase Storage
      Reference storageRef = FirebaseStorage.instance.refFromURL(imagePath);
      await storageRef.delete();

      // Show success message
      print('Recycling detail deleted successfully');
    } catch (e) {
      print('Failed to delete recycling detail: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Recycling Details'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('recycling_details').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No recycling details available'));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final id = docs[index].id;
              final imagePath = data['imagePath'] ?? '';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Image.network(
                    data['imagePath'] ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(data['item'] ?? 'No title'),
                  subtitle: Text(data['description'] ?? 'No description'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _deleteRecyclingDetail(id, imagePath);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

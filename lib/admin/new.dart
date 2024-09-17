import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPostsScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _deletePost(String id) async {
    try {
      await _firestore.collection('posts').doc(id).delete();
      print('Post deleted successfully');
    } catch (e) {
      print('Failed to delete post: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts'),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No posts available'));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final id = docs[index].id;

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey.shade300,
                    child: Icon(
                      Icons.image,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  title: Text(data['productName'] ?? 'No product name'),
                  subtitle: Text(
                    data['timestamp'] != null
                        ? (data['timestamp'] as Timestamp).toDate().toString()
                        : 'No timestamp',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _deletePost(id);
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
